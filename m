Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AA9398F83
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 05:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764826356; cv=none; b=ewsDgLyEzvE1NUo94whbuVACENGn+cUN8W8jEDfLEKHJLPbvq1dmK4v/AbUtXaN3uSqJjBbGrU+VQvWsUmN63ZUjM/s7buPHyEoHeAmvDGYS3/MA4akEW3S4Bq7WgmPQWGwi6pUE0Aj11LuBJlgQ93u5LMn14zNQhwNABNG3vqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764826356; c=relaxed/simple;
	bh=jHMETPAYYWVY3z8vi8F575I8YLz3w0b466Y1BusbiDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDuLVRWseP5jtQXxc79BuQxTnbCSQl8rKJjwEhj+drLhiLkSBJ5LbJnmR2XcuX0mlXUuM0ExqANhbe8KG7Vih2WE4A2jUtZ1U+sqO+Iwcv1iABCihp73cD30wNun1UY2VCZ8kwNEggmPzXK61eNKsyS1DHiZobcvO2ngiRuK0pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nx2QCFJj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nx2QCFJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AA9C113D0;
	Thu,  4 Dec 2025 05:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764826356;
	bh=jHMETPAYYWVY3z8vi8F575I8YLz3w0b466Y1BusbiDI=;
	h=From:To:Cc:Subject:Date:From;
	b=nx2QCFJjPqz3imPj0YlZl0TKnFmPGM7oom2dR9tZzP0MvFsXtOdCrVZ358vFRoM4O
	 1a7bLgvftM44y+b4Msg3Igxjpv1hE+LbC2N66rUIkMoMPdT+0RQeaxi1jib0JbgvFF
	 WeKbh3EsLIC3W6fbhLkUzHe9sYzYiOW0z3RMoyrSxFd1jaBvih90NO4lznaU2ehl+Y
	 CtvyHs0UFBdN54eOV/scwHb1c431xU0sd4U3Sgi2MEIFgJI0Be1BeIuCvmEy+a+/FB
	 /uPhodGUV79eDzg3LwwiC1qfUplx35l3OQ2nvSKbU+LreZMaF4KjVg/nm7aVc8gyH5
	 NreJqVR8RWi8Q==
From: Eric Biggers <ebiggers@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] ASoC: cros_ec_codec: Remove unnecessary selection of CRYPTO
Date: Wed,  3 Dec 2025 21:29:54 -0800
Message-ID: <20251204052954.488568-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only crypto-related functionality this codec uses is the sha256()
function, which is provided by CRYPTO_LIB_SHA256.  Originally
CRYPTO_LIB_SHA256 was visible only when CRYPTO; however, that was fixed
years ago and the libraries can now be selected on their own.

So, remove the unnecessary selection of CRYPTO.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6087ebde9523..a34a68d12668 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -775,11 +775,10 @@ config SND_SOC_CQ0093VC
 	tristate
 
 config SND_SOC_CROS_EC_CODEC
 	tristate "codec driver for ChromeOS EC"
 	depends on CROS_EC
-	select CRYPTO
 	select CRYPTO_LIB_SHA256
 	help
 	  If you say yes here you will get support for the
 	  ChromeOS Embedded Controller's Audio Codec.
 

base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
-- 
2.52.0

