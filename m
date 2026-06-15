Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56AE30AACB
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781566441; cv=none; b=Xf0z8XYOJaJ7o/8y7MhFVstHI35/HZ73mTTW7ethAAuG250lUrWdJb9xmbaQLhsp49t2aOIdZ9mDHgLi0OcLljyYY9vaWtjvUXv8WMozNky+O07XxVulrLwfgQ/SbUSn39e4J3yLkNFBaY52dppBy4K7BMj7kgiWAK9iWK3k9Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781566441; c=relaxed/simple;
	bh=9T5TXJjJT/W0S+9iEkwNGDuS1oeznvsFaTswzHNnstg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4+Thug8sKK2EpYZ7QfyrcIUUh8K9NLoKCe0n4jbPNQ5+epJf+pHBUkb6trg2CfB0sXYSCfRQPS3bxeSuHap2BkIV0ZLGPlW268OW0AnzXs1hCsw/hKh/UoRyzIKWKPwAEjzalPhgaquTCQuqFys9n0mgL7/BrFHWU/pgJQiCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yrq+v5gJ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yrq+v5gJ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b903567fdso4471560a91.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 16:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781566440; x=1782171240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8FuvkiARpXIOFd5JwFqJggn0SYUMBb/rFOpyqvH+ZM=;
        b=Yrq+v5gJikFUUQ5mWDwbr8rT6d4cZN3fBj6TPgvdq1hH/xNeq8OLiZ2/N4qYamV2ST
         LkHoXYXflb21c6J1jZ4q5GGDtqfquPRJagA9rAUU5Hs1z9DE0tZf/c/ICFo1VKWYNjq7
         qxZy3hWgxgTsVu6Sni205WYdHpR4/4L+b6l20Q0jj3nBgyXmd8873uriRd/26dWMUZnF
         meL+ajnm/vaw0uBwRPmvhEVk+gWhbTP/+GxeoLnDArRnP2e5SrphAskP0kvGpao6osFz
         0Q+Uo69eZ8A47dqxD19sov/BZ8jBEhDTb3qqPTTtOqmUYMm28VwFj3R4VRpi7t8UC4S1
         DGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781566440; x=1782171240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8FuvkiARpXIOFd5JwFqJggn0SYUMBb/rFOpyqvH+ZM=;
        b=OVAcptZjDeb/iP1dWFYPWD0Xi9x+VeyAcYnHwtZoJFZEoUsRiqUF6ubanAdNyp/vqR
         GM38O8D1HSnY5jw88l3lpCZCmfxO9590oXxgQZJIMzwqdPADYiOUSzEih/5xKH4tW4Jn
         EirJrhov3msU7eB/U+P9YT2RdIxCuEsTzcweB7sKZ52v0WIVjVretR1bbeDw2Q8R0LZs
         OjQe02LyFTrOdSY97Ovx+z7zDGue/FQm4s+tPHVylWNZqKnAY9L45EKG5p71uqOG2uHn
         E+jlm8bqiL4L5KlYval+O6pJ/COg/w4V0VvqL1//ZdHSQ7Kqyrme5geKOPr+R34LvPMk
         WjJg==
X-Forwarded-Encrypted: i=1; AFNElJ/gLV6gq1p0Boj7rggndZ74ryJhyep3faWWWpnQcdFJxs6lKMtmm1LX9UDji4klD2JejP13fdxCPnNI+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyILviR7JA9mQUd7THYaplUuGvAY7BhhsEMXKu3tawZ7Rr+jRBl
	56Qmj37mSIzhwBJrriM6ey4p7TjhVrt9AU+3d6UYkqS3Vhj0z3OPjTzj
X-Gm-Gg: Acq92OGuNAnAkGvvmFG5FG77+AsgiBtP0Cy2J/aslCiJNPLVGQw42Zsr+tnvoiIlP5G
	wWVblM6cHN1o8GWtrfS8tnGhk2mrpDrIn4NkGC85xGpSqGEWttWIsi95ENyYoy0dZ4lCwOopg9N
	QeoA3aFScjL7H1rnvwosGOiOXUD0eGigmXTNtMkXuPz9Ye1aM1Wbo1ZCoObAp7inZ/D3lZ5pH2U
	oQeyTJtxMqO9cOIaeFhcUP9oZgp6KJl8EXpRhwx6DTEiGrC5/k5VzotYf73uTG3FftvLr9xhU5g
	RclC1g3pXILYMj24Ksh5wt5uToihbpfSFMG5UWnrqojbtL+6ZJqd0CpEaGCdOcp9d8SV+nIiAhh
	qAWn/EirmR0L4+d/iGmNVVm47i+sxKh5CIUVXsoyg+aQnjdgb+JQZ0Ts1Om6y9LZ7/OKU35Ygai
	YRtFkq0u/0AEXzLZ/d9ze+mfAWRvj3xa1Zxg==
X-Received: by 2002:a17:90b:5109:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-37c528e0f2bmr1211166a91.15.1781566439872;
        Mon, 15 Jun 2026 16:33:59 -0700 (PDT)
Received: from tall-manderson.lan ([2607:fb90:9c20:d8f0:780f:3697:cc13:5d3a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e88d546dsm7118845a91.2.2026.06.15.16.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:33:59 -0700 (PDT)
From: Galen <rwekyes@gmail.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Galen <rwekyes@gmail.com>
Subject: [PATCH] ALSA: hda/conexant: Add pin config quirk for Lenovo IdeaPad Slim 5 16AKP10
Date: Mon, 15 Jun 2026 16:33:53 -0700
Message-ID: <20260615233353.19913-1-rwekyes@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo IdeaPad Slim 5 16AKP10 (PCI SSID 17aa:38b6) uses the
Conexant SN6140 codec. The internal microphone is on pin 0x1a but
the BIOS configures it with pin default 0x95a60120, which includes
a jack detection bit that causes the kernel to treat it as an
unplugged external mic rather than a fixed internal mic.

Add a pin config quirk that overrides pin 0x1a to 0x95a60130,
setting the connectivity bits to indicate a fixed/always-connected
device. This allows the internal microphone to be correctly
identified and used.

Signed-off-by: Galen Hassen <rwekyes@gmail.com>
---
 sound/hda/codecs/conexant.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index e3b6aaabe..40d4591f9 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -291,6 +291,7 @@ enum {
 	CXT_FIXUP_HEADSET_MIC,
 	CXT_FIXUP_HP_MIC_NO_PRESENCE,
 	CXT_PINCFG_SWS_JS201D,
+	CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10,
 	CXT_PINCFG_TOP_SPEAKER,
 	CXT_FIXUP_HP_A_U,
 	CXT_FIXUP_ACER_SWIFT_HP,
@@ -826,6 +827,12 @@ static const struct hda_pintbl cxt_pincfg_lemote[] = {
 	{}
 };
 
+/* Lenovo IdeaPad Slim 5 16AKP10 with SN6140 */
+static const struct hda_pintbl cxt_pincfg_lenovo_ideapad_slim5_16akp10[] = {
+	{ 0x1a, 0x95a60130 }, /* Internal mic, fixed/always-connected */
+	{}
+};
+
 /* SuoWoSi/South-holding JS201D with sn6140 */
 static const struct hda_pintbl cxt_pincfg_sws_js201d[] = {
 	{ 0x16, 0x03211040 }, /* hp out */
@@ -1006,6 +1013,10 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = cxt_pincfg_sws_js201d,
 	},
+	[CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cxt_pincfg_lenovo_ideapad_slim5_16akp10,
+	},
 	[CXT_PINCFG_TOP_SPEAKER] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -1116,6 +1127,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo IdeaPad Z560", CXT_FIXUP_MUTE_LED_EAPD),
 	SND_PCI_QUIRK(0x17aa, 0x3905, "Lenovo G50-30", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x390b, "Lenovo G50-80", CXT_FIXUP_STEREO_DMIC),
+	SND_PCI_QUIRK(0x17aa, 0x38b6, "Lenovo IdeaPad Slim 5 16AKP10", CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10),
 	SND_PCI_QUIRK(0x17aa, 0x3975, "Lenovo U300s", CXT_FIXUP_STEREO_DMIC),
 	/* NOTE: we'd need to extend the quirk for 17aa:3977 as the same
 	 * PCI SSID is used on multiple Lenovo models
-- 
2.53.0

