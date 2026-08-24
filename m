Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42E8374E46
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 03:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542935; cv=none; b=qdXHP9Yi2b0MSfz+i8TUV5cAu8WUrLlk7QrwpyDdwFGIRtrub19DYwzuK+ziK4lU8HLf4L3gtwtMyptZwEDOQ/Hhvd9aqCoTqjp9t890Sft0ux4YXwbS/Gr7W8x1fwLZhzDtrLbJ25evUKPAaFZhiEUVh4pinWGWaUTAAUWdbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542935; c=relaxed/simple;
	bh=MFIzyWT8F9A/1lshR1ryEnSqq4/4pWAI8uJ5ufFlJkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DkX9f0vFAookLp0BhaSX6FyOX+xaC2zy829obzagRhWAIIdEd6ONBJJdCIHjCQbjIk1fImvqHONslG4gvPC7n0HPdRocgTvPXcBejvrHqfQr207I1eYn2aqefXbEDH1NZoa/aITJXeSP1nK+PQFteZ4YmH1dHoh7l49nTGj8C28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=carbonforge.ai; spf=pass smtp.mailfrom=carbonforge.ai; dkim=pass (2048-bit key) header.d=carbonforge.ai header.i=@carbonforge.ai header.b=BXX6Fjzy; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=carbonforge.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carbonforge.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carbonforge.ai header.i=@carbonforge.ai header.b="BXX6Fjzy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2388978a91.0
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 20:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carbonforge.ai; s=google; t=1787542933; x=1788147733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz3yNIKXk93XJQmWzLRjDKnLYXesr0VHBU/TDoHHaYs=;
        b=BXX6FjzyvE383Chxl1kfYge4rYJBXBmINqCdvu+bqLjUxs2fblCTYXiX6OPvOTqdt/
         CQpHC3txtmwlCQ5IfZT1UuKhT07igDu0nZb0wr8T3b1Ira1hDXGjhp2LzukNxLuXsgLa
         lFDkaoXNZdcfBtZX1WYYDD+pvJG3jff5AOjwmunPWdgn9RGmUrGTKpTtN6ATtbZZoS8p
         fP+MNMYljfeat08aHYHWO7dF8uPQq3bswaanHpBNSk+/v8RMXvDagdzcDqy+Blo5izLh
         xAGJSJXLje2MONJty+4sykjt0bFynHr3pwqxNuuix1Wlwaw3HpX1YHzRwoBhlTLvicgl
         J+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787542933; x=1788147733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sz3yNIKXk93XJQmWzLRjDKnLYXesr0VHBU/TDoHHaYs=;
        b=fDn+uHZgG/FK6eoiYylQ4EXW/1/VlbIDQf3GgOOtV8DHWyPQKhqxgUrZOMMQvS/iFF
         UWrhflFVLZfWYh2YnUCykelFEobex3XFBx3zzevJRrso7dsVw+cwQK5YtP1iMlOpMBvu
         1c8+qZtButn6c35ASfAG2EkRwanuFBCfQRrCIxcQXPFAFOr6XDP2wyOMICgHPjqTjNkP
         EhQlTZjq9BnNQGCkikbL2r+oKEiD/RBl8QkXC3NNNBK/ydjONU7yEXzqsoP3PWYf0gSj
         u6AZ/PM/qONslWnOKwsqZOjbSJ5wbjzy4iaOiSNV2PVu6hwb8Yr4GhtuFnovocqkMNFt
         IDWg==
X-Forwarded-Encrypted: i=1; AHgh+RpckEv2FuYUY6sBTLEmD6mYdEMNbzyJGBWmIDZl3FcprjBiaRUXf0TBZwPuQOaCc8hRG2q2fvY01reD/w==@vger.kernel.org
X-Gm-Message-State: AFuF++nrtexosEm07Frs0oUmAeex52CuXPMBVXz2vOIkgjE7cvKaZCa0
	JRAZjBiyBXkrGBq9sN8bPlD40z/sy3WG6Nyqqt9EUfVnruZJogN7vAix02rs5rC2QVOA
X-Gm-Gg: AR+sD13CqCkTlVkLaXAX/R0rNI+SWzZf7ow3s3gz48BHBPZ9i4q6Ihf6Ff9QWno2eQs
	dN9LVG4V2lWQk9MvoqiIDUqiKNX4icabUpkyx4o/LnWAiCjyjAtNnFrJERbEYRYh7b3kHpGrcBO
	iI52U3UchVFVdWtzNawWrUcp0WrZswja/XrzmR14Gy7oYCSp2+g5/KzNEcytEariH7o2VPzG4FI
	C1HKQyIP1UoyHA6mgk60quiYSV4BrxGmgf///pBTEXVRyX+XT7VT4DJ1Ic3AjKG7fjIMiwDee8C
	QT2GBpQUtKwXhI9HN5YIGEG750y+0bXLZWirNfFLxSNZezaCqZOh6BWKiv4Gp9NOltx091KHKAm
	NsGlKbyKcOgc2eps2g0UrByaoTjkJRIklJ+4UMnM8GGtU68I7iCja6cLGx0ZOPEqWOxXD9jnvkL
	azZ4oSsP5H4DmuDBENtOUnZv0fR6LOE/IOcjHsWtok8A8f3iNSB8X8WJY4oDQJTr8F3ZRvyI9UN
	6ERWlEKjBMwoeiQHG+cuffMoR/GSCuhWhZKBnMWm1hjUgSWOjvfVtH/VH8igP86RJlFM+zLxQux
	oRkga6yqiuMjCUuhj0yQmmUp1u1ysJ6PGXqQL6EGFJdAt3om3qSIQn9mNwrdil27uI14axPIl29
	B+b1xawQ4ECNPxll7SngLyRRc0KOwFUeApHLpXA==
X-Received: by 2002:a17:90b:4a81:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-395c33ec558mr38258800a91.7.1787542933045;
        Sun, 23 Aug 2026 20:42:13 -0700 (PDT)
Received: from jml-HP-OmniBook-X-Flip-Laptop-14-kc0xxx.tail8972ac.ts.net (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90e22f8sm19080206eec.13.2026.08.23.20.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 20:42:12 -0700 (PDT)
From: jml <jml@carbonforge.ai>
To: Vijendar.Mukunda@amd.com,
	shenghao-ding@ti.com,
	broonie@kernel.org
Cc: venkataprasad.potturu@amd.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	jml <jml@carbonforge.ai>
Subject: [PATCH v2 1/3] ASoC: amd: acp-config: override ACP config flag on HP OmniBook X Flip 14
Date: Sun, 23 Aug 2026 20:41:51 -0700
Message-ID: <20260824034153.50193-2-jml@carbonforge.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824034153.50193-1-jml@carbonforge.ai>
References: <20260824034153.50193-1-jml@carbonforge.ai>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OmniBook X Flip 14-kc0xxx (board 8EA1, ACP 7.1) does not expose
the "acp-audio-config-flag" ACPI property on its ACP device, so
snd_amd_acp_acpi_find_config() falls back to its
FLAG_AMD_LEGACY_ONLY_DMIC default. snd_pci_ps then declines to probe and
snd_acp_pci binds instead, which has no SoundWire support at all.

The result is a machine with only the PDM microphone and HDMI: the
SoundWire codecs driving the speakers and the headset jack never come
up, even though a matching entry for this board already exists in
snd_soc_acpi_amd_acp70_sdw_machines[].

Add the board to acp70_acpi_flag_override_table so the config lookup
returns 0 and snd_pci_ps can claim the device.

Signed-off-by: jml <jml@carbonforge.ai>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3021dc498..a545dd679 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -30,6 +30,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
 		},
 	},
+	{
+		/* HP OmniBook X Flip 14-kc0xxx (Krackan Point, ACP 7.1) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8EA1"),
+		},
+	},
 	{
 		/* ASUS Zenbook S16 UM5606GA (Strix Point, ACP 7.0) */
 		.matches = {
-- 
2.53.0

