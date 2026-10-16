Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157738B131
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123912; cv=none; b=royLHO9J2+KclnVphdwIeGvSXaZKJEj11hsRLstnj1UMgzJFJJ/yQWm60cvqGb6uUEM/MjT+hSxxHXgxLHexSBIU3j35hG518wddXOgC/rCITYVMbT+layiNSiXJaoB4NWNOEpFgzDT+ZIWXrf3jKPDZ2cFpQdr4RzkQJMj6RWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123912; c=relaxed/simple;
	bh=4ChQc4DpaiRpFVYZQOX6JdbhBOh/CN3kyOWjnYuDL7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQ8bXvPw7vDexLKzg57EfD60yGyBDrTFdNSaMXfCH0nMOeilGmMeddop8r+x8OAe499p8Hd7bysuIKjwD/085DoFK+fuTLEPlkAaHhk4A1c+nc+RZNa8UiB43UQpd8qGdywGUXKMonIpaX1BOP+2HLITYWxIbG4nYeBAUPoYFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkSLpo0d; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkSLpo0d"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6e954afbdso13640815ad.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123910; x=1792728710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnS3efznOy4aR/sEoOKiH1O7kNcA8JAEG4dTp1VvwAA=;
        b=IkSLpo0dg8gDTpc7uXJgGQtTQah0S3KSH+fTDrP0VvdSOPv0+YZwwd4RTMSreURrhC
         n8cO88xjNHxVLGmzkgxPLWX+k802f9Ayodj0odcf6WlosvVdPCEH6OADiE641kq1jEqA
         ulaSBc6iKoTgqUmkU69ADiAxmjCwjV6TUsFy/v3fRKm2p6XA3dsqQVnZWYHvs9Gv+C0t
         QuGujpf4WlyxeMJQAg8E1oruJZFKUEamICz9VMn1RSoKXTNfpmCaWAHxPZs2PHAW3uBb
         zAW4ABENh5X3SgF6CmKjPaFpQ9HV7OHZwwJicWacrqyxjDOErCjBEHUj7k9KXRR02FrW
         kmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123910; x=1792728710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnS3efznOy4aR/sEoOKiH1O7kNcA8JAEG4dTp1VvwAA=;
        b=ZwwVCneYSLUT7GeN4kuOMrNR95EcL0oaVSAOoO+38B8A6K0EhRUc6T7dsebCD7+8vo
         KicTXXYilDtBYMDd8G/Mn7uViS3rxTf80SJ3rObaC5Y6MIBcCzUfvO2fTbt5sLVEHZSc
         6s/WQkk9JJhr1RHIqJKR0Q/JigLDG9wUYo/OqD+4NXHk9cvGdmxsCfrclcs8H7y6CbAT
         ae+7qslT/i6nGJu8JEtgXWESVZv4XPAQmjRyOSspl+zqiUazCOy3kAm3uVojcR8hSgrA
         MiTWjbb2VGsILhpnzfeQ3cC8jKIoEdyx4hkjwKw4KqEwdvQxndvDGdy9B+6Yjp54GJwJ
         d/Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwrpVGBNp4OSpdliaTox/t4l0bSkQEM9mxLLd3Yd6yU6e1K1nJekl2exgR5AECqxWQcfNc0hxaUQgvWjA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI3TwR7711VKjRiZDo778gU1yUVIx+yOBMmvI3orM4UXOe9z7Hj
	Bua9T+Wh2k6AZGY+SGosyswcoT5lbcHZ3NUmxy4+tCBKhQX+9mNFFAmi
X-Gm-Gg: AYBFou3+zvw8S73ipqn/IJoq9hm0jOUDbmfMvb0KD6sQ97xbKYWyvtv8J21/Uc78NwI
	9eNrLvoBMp14ZFX7cBsUIFKwGelbwMqOJ7M537gYsrkuaWPFDGZTzIfoRh9qVT0fl3JlhfJVp1r
	LI0K5Uemhc6kKFPNzrnf9fg0Oo77UO+wCxLTwOBDfuQXVWMVyenuMBR3YMuKD22+2R1I3k42MbN
	U0bd2d9EYNW9a7AqxCDzmdOy5w56HKrmP+xLXbsg7t/e/yxHQt9l4eJ8QqtL9b/BEYy3kr1/XH5
	6ei3KW5iv4BPbYKFuYJ/IbXh51UxfNOdLsT3IrL0ne7fWK06sT9+11V4vA1LteKSD0NcZL4GM8c
	zAvr1zoDm5iLWeBWPX12zjOWr8+EOs6E0EoLqhF1J2OEusoB5Tr0c7k7/bJCCAcS9foNaJdt6Qf
	ioBT0pFSHrdSLYkDTLEfjDknLSrsHHaCDiFJzugjzsxi1SZnMMl9eLhhCdFh2O5I0hzSaJfLGpb
	ZrVv8Q0xxAfrmpIt+g8GRhHvF+aAi0fJOCaq1945dK0b3DR3w10SaufHLRzeES3r5XEG4FM0aTM
	deO2kPuPUYp0hA==
X-Received: by 2002:a17:903:38c4:b0:2dd:c100:4257 with SMTP id d9443c01a7336-2e842f11875mr181177615ad.59.1792123910214;
        Thu, 15 Oct 2026 21:11:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/11] ASoC: renesas: msiof: Remove redundant period constraint
Date: Fri, 16 Oct 2026 11:09:43 +0700
Message-ID: <20261016040946.521195-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() is already called by
snd_dmaengine_pcm_open(). Calling it again in msiof_open() is
unnecessary, as the constraint is already applied and the second
call returns 0.

Remove the redundant constraint call.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rcar/msiof.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 9fead9a22cdc..11a6f22ec0ad 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -419,19 +419,13 @@ static int msiof_open(struct snd_soc_component *component,
 		return PTR_ERR(chan);
 
 	ret = snd_dmaengine_pcm_open(substream, chan);
-	if (ret < 0)
-		goto open_err_dma;
-
-	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-
-open_err_dma:
 	if (ret < 0) {
 		dma_release_channel(chan);
 		return ret;
 	}
 
+	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
+
 	return 0;
 }
 
-- 
2.43.0

