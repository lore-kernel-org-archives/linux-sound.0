Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58463346799;
	Tue, 27 Jan 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530132; cv=none; b=hQir7fW9NkMCFWF65itv7G7Z7AcNdEfE2H56+akidANkGllsE9B/5GxsPgHV/FrUBbJFGsnbtwbB22wtGg6sUTYdBUeBht2EuMJmZJ9+r6Exz/ZoeYzKdTp21AgfQDu8TePnW+QepQA0WzxhU03R7xQpWxEDJDHaLlMuv/gFbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530132; c=relaxed/simple;
	bh=/T2aZbWQYbxx98eibpJB5+OY5gsOeKfgeJT1TgQzpek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uGYtO8wB3kT/BXm7ju99KfZaJ00RwMNr/GKx7yxwo0/lXfP/yIJICbYG6RR2SPADfhGNkvxWV945iG4rDzX5Ub0utUuojGkv+8LJpTP8/cB3ldTe3rlK69vM0lK5c9+BYiUVJDq0ly4pHfjZciTZuo3OHL4IdozAYbUe39em9K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UKgTf2Tw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UKgTf2Tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530129;
	bh=/T2aZbWQYbxx98eibpJB5+OY5gsOeKfgeJT1TgQzpek=;
	h=From:Subject:Date:To:Cc:From;
	b=UKgTf2Twc2fnwyI/icMXZcMnylUOmuNu1vNOiXeFXyDf/c3UQXtUO/913C9wzd9NA
	 hBL3REXTAFoxOab1Bvp58iTmRtejVL4WxWD0rGBAn0Ui3Ivs/V/PMM7w0WKB/EO3/i
	 9NpiqhKApGX6T8odQo1BXW5muOSK2nf8mv1x/dpSskO8M0Eo8N7OcIzQ//YwuMT8H/
	 cBf5wpkclFvb+qjjMa5jVc6nXPAWzwcECWMAb7hedwn9ghwTQzq9BEFRbC/9AA8RAs
	 H2SeozwPwuhDZqo5Sx0lpS98Tf7ch9xHutqIgHawt2o3ix2/O1oahtR4HvZWDnTkCI
	 AT72WVx+us2+Q==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C09D17E14F2;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 32A01480044; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 00/10] ASoC: rockchip: spdif: Cleanups and port features
 from Rockchip's BSP kernel
Date: Tue, 27 Jan 2026 17:08:20 +0100
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPTieGkC/x2NQQqDMBAAvyJ77kKMGmm/UnpIN6suLWvI0lIR/
 97gceYws4NxETa4NTsU/orJqhXaSwO0RJ0ZJVUG73xwrQ9YVnrRIhktJ5mQ3hz1kzFqwqdVuyk
 hXXvXDezH0DuopVx4kt95uT+O4w8kwA1adQAAAA==
X-Change-ID: 20260126-rockchip-spdif-cleanup-and-bsp-sync-c94035e27640
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Zohn Ni <zohn.ni@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/T2aZbWQYbxx98eibpJB5+OY5gsOeKfgeJT1TgQzpek=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xA77Bb6AfgV7b7ypFRt0LyLnZnYGdS1f
 uKYvaJHNwMGlYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qaq5IP/3id/KXkGg9KLhhF27rU4MPk19/mdz3R/A+pjTuvzU1dvkPaB0aKEGtBYxtKSTh2TJ+
 K64fpjV5m2NwNoB04K+kZ6g/qz8Aawm7oCb8KYwatXMtjkW82ilN49Erc6K/EDSxo1Tyr3xzBff
 IpeVw/e+Pu8oSUa8vmHuySCpx1nfvz8EuG7um9mAEMPWqdzXjZwE3msDCVCt0UlM9cruiXGYv0K
 BsaCyMoWUCdvFmhjjOmeskGepwE5eWwmUZ39lfqnH72kP3iC79cd5AXreYNfFnbfwkCYK69DjB5
 Y8lCIqPRnQZJpLOt4DjC3Kf8iNeHEAFsMj3quJ2Ky4c85L1IR55VF7qMpcGzDJmG9fSu+Qwo9PA
 BFDo1y5fIPpH/grZ58IcvgcH51Y0LzdewvJBG+jA7Btd5ZvwfxiwIZPky+Pq1fMURB+mYHvwrh+
 CqGj05g7M4Csyc7kOdZ0lDSnurBX98k72/M2UycWFcv3TxMhjqBFlnUvntcshhIP0B4prAFrDgZ
 Snh+36fCbQSoqBYO75W/U9eYln218UCbqA4YulSS3LOPYsmE0u2F2HDwwhqKFH1pEQp2lWWZf5z
 A+AlRZwHY9aFBsJANEdMTjzA5+3HkPOqpXUoZ9VlyRZEmrCZXf6hbnuaZlb5KqID/C3yA2lqSUG
 OEo57gxIY2juolWLuoN807w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

I'm currently working on DisplayPort audio support for the Rockchip
RK3588/RK3576 SoCs, which preferrably use S/PDIF as DAI source.

Apparently the upstream Rockchip S/PDIF driver is lacking a couple of
features right now, which are necessary to get things going (i.e.
setting the sysclk from the machine driver). I found the missing bits
in Rockchip's 6.1 BSP kernel and ported them over. This series effectly
brings the mainline kernel on-par with the BSP driver, but also contains
a couple of cleanup patches of my own to bring the driver to the modern
age.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (5):
      ASoC: rockchip: spdif: Use device_get_match_data()
      ASoC: rockchip: spdif: Move DT compatible table
      ASoC: rockchip: spdif: Fully convert to device managed resources
      ASoC: rockchip: spdif: Use dev_err_probe
      ASoC: rockchip: spdif: Convert to FIELD_PREP

Sugar Zhang (5):
      ASoC: rockchip: spdif: Improve sample rate support
      ASoC: rockchip: spdif: Swap PCM and DAI component registration order
      ASoC: rockchip: spdif: Add support for set mclk rate
      ASoC: rockchip: spdif: Add support for format S32_LE
      ASoC: rockchip: spdif: Fill IEC958 CS info per params

 sound/soc/rockchip/Kconfig          |   1 +
 sound/soc/rockchip/rockchip_spdif.c | 224 ++++++++++++++++++++++--------------
 sound/soc/rockchip/rockchip_spdif.h |  57 +++++----
 3 files changed, 175 insertions(+), 107 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260126-rockchip-spdif-cleanup-and-bsp-sync-c94035e27640

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

