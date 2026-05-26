Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC163C8C49;
	Tue, 26 May 2026 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779832413; cv=none; b=qvwoWC/zIlKfFhGVt9+E8fwGT/HUY8WSJG1U9mmmQx59lv6WeOvzbiCZWacF4qEecTd+5ssRKyVXajQLKFSyOSrPjfvG7jnQdpsVlhRJWdpqaBVOG+TEt+xliY6AiOcOm4o5yh0OSLr/cTZDRIcjXqK/Sx5glckMMX7ZE12ezYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779832413; c=relaxed/simple;
	bh=kWMLMK4TUemH3G9BgYoBZqceG1bzH91khV1N/2Sow8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEygJNblZ6+2fSN0Ep8c2H8VdVHr3mYjRlbAZJXFuPhyHU8fTqgPmb4HxLvSWVvErnW759J0hfMK77+LyE4TOzDPvFjaqYTqOyTPtdZBav//JliTiCoBx9QcjzFEAf+QryOmrBiis7MgpI7lTlXkYwG83vRkbGt3pRlLmNhSZ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvAvYF3h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvAvYF3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A831F000E9;
	Tue, 26 May 2026 21:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779832411;
	bh=3x4Zv+5eX8mYjQm7zgQs/be0AoAuppKfxUzMWlmTe8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dvAvYF3hTJfyLZjCkcy6Yvy46XIRYtAFDvxIZqmze74SurKIurTKR1JnHt7SoqM3K
	 njkGI7GD60ECf1aX+dhr4RgCtLesU9chWOiyRDwtmbHFoLVPFTCGULb2veCOI1fkfb
	 BTp5d0w47SeGRd+Hr9eTlMqYKPX5hof323ZGpbkZNql0F00WvogxGohEGjtVjPrtsg
	 quPc2FFTxzAk6ZaOMuWQfmIgx7M6O5BbEGXmZ5UtK2IUDE44bXNgJ0pqU3rVQmb/3n
	 M9xnk+eFbIMxN2BmmRmNf7PTVJfWj8y4YbRB1ztNtl79RRcD6VclHmjZBjfRb0TTE+
	 Q9Thq8Tluq8eg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 26 May 2026 14:53:13 -0700
Subject: [PATCH 2/3] ASoC: codecs: Adjust indentation in
 CONFIG_SND_SOC_ES9356 definition
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-es9356-dep-fixes-v1-2-39ac16f43d54@kernel.org>
References: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
In-Reply-To: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Zhang Yi <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=876; i=nathan@kernel.org;
 h=from:subject:message-id; bh=kWMLMK4TUemH3G9BgYoBZqceG1bzH91khV1N/2Sow8s=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFliYkH7lyxaner4crn2AXOOL5tMap8en7F0fW7syeqg5
 TrzCwKOdJSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJmLIzMpyqslsd3KMvO3VS
 Y8uOyB/Hb3RIhU2WmfvOu+5c4+OqnYyMDMti5gStLnH/skyl4NcbVocQzqMvn55QOV8ac79vgoX
 2TC4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

The indentation of CONFIG_SND_SOC_ES9356 uses spaces, instead of the
Kconfig standard using tabs. Adjust it.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/codecs/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a7c61f7c7f4c..9b6c7c7533bb 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1301,10 +1301,10 @@ config SND_SOC_ES8389
 	depends on I2C
 
 config SND_SOC_ES9356
-        tristate "Everest Semi ES9356 CODEC SDW"
-        depends on SOUNDWIRE
-        select REGMAP_SOUNDWIRE
-        select REGMAP_SOUNDWIRE_MBQ
+	tristate "Everest Semi ES9356 CODEC SDW"
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	select REGMAP_SOUNDWIRE_MBQ
 
 config SND_SOC_FRAMER
 	tristate "Framer codec"

-- 
2.54.0

