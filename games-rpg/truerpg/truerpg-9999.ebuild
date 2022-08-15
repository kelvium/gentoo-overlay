EAPI=8

inherit cmake git-r3

DESCRIPTION="The game we all dream about"
HOMEPAGE="https://github.com/TrueRPG/TrueRPG"

EGIT_REPO_URI="https://github.com/TrueRPG/TrueRPG"

if [ -z ${EGIT_BRANCH+x} ]; then
	EGIT_BRANCH="main"
fi

# TODO: ask compile_and_run
LICENSE=""
SLOT="0"
IUSE="debug"
KEYWORDS=""

RDEPEND="!games-rpg/truerpg-fork virtual/opengl media-libs/glfw media-libs/glm media-libs/freetype dev-cpp/yaml-cpp"
BDEPEND=">=dev-util/cmake-3.15.0 media-libs/glfw media-libs/glm media-libs/freetype dev-cpp/yaml-cpp"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
		-DTRUERPG_USE_SYSTEM_GLFW=On
		-DTRUERPG_USE_SYSTEM_GLM=On
		-DTRUERPG_USE_SYSTEM_FREETYPE=On
		-DTRUERPG_USE_SYSTEM_YAMLCPP=On
		-DTRUERPG_RES_DIR_PREFIX="/opt/truerpg"
	)

	if use debug; then
		CMAKE_BUILD_TYPE=Debug
	else
		CMAKE_BUILD_TYPE=Release
	fi

	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}
