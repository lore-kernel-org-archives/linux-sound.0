Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB9307AC7
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 21:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115713; cv=none; b=HqXFl0r6l6EyjzxKIjA1btBVi9m8QDWPdudGXlDDEKJGiAokPDGDktTnYSTEcMlVUMwKHmLY5VDno/vlDgjt2EOgu6YrpKlytEjhTbcBi7vSEITEM47XUXuyPHZIpAcSCyglUqSkTVXdV2rzNmK01N+Z0GJLWnNYartP0//940A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115713; c=relaxed/simple;
	bh=5c2CTBsa56ggTruyu34zlgPQIqCG/hoOHwFpZzV3lqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKjRZ2zCzqi7cKcUBw7eOnSwUXfc1u7NDiE2eTZwJJ9/gF/OL90giY5N5WlFefuQbjekbVwWMYjoTQ80j+TvowAhnTMnaqmVfwmY2TixtI4BfjFHCO+0ecOlWDJLXH7VftneglYHX38Ax80PGRvZVk+AvUk2WIlaTiysJFnRxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA6iJZ9o; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA6iJZ9o"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82cebbdab08so3669615b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 14:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776115712; x=1776720512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONnEdVE3o8eW7nuVWY1dGeZByLtYI03IG6ccjXhCWCo=;
        b=ZA6iJZ9oVzRR1jktL4+6DsGVsmCh3piehvfVytu4Nhd9oI7aROxzUvp3tcxWX5UvwU
         dOCmyOEoids5+sJPeaO+rhmVybSV52kXJvEtxdkOWrs9BkPpDgWR/iq7Fx0lMyWcAmaA
         OQp6vTPw5uMTFRi1rNOdZYIYBr+rhna6o3Y4LXFFo0SGtnk2cknjnlnIYxvSO+CXNiEn
         a8reSQdtu4NF6PRReKCBqwYo829qRac9FtytfedXcaEchaPPTsfCSOOAWz+2gCZ/YQPp
         69tWMgax57/gN4A95RWST4gHppQ5FSuvtQAXkRzfT5rfxKUJ3yNta9IhPgsn20eD0/Dc
         YIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776115712; x=1776720512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ONnEdVE3o8eW7nuVWY1dGeZByLtYI03IG6ccjXhCWCo=;
        b=AsMM/fUNivDnjoj+mvBKeGEpj27/3b5rM3RL6q867PiTzQbqOZRK1FPtmGUXW6o5dx
         imsXVY7wBCdMqptD9zMHKxw8Z+eHtKSdCnkd81/ODobYtwnR9xfEaRZGiW7oAG78N3Bv
         PItrySZJsdoYQmNs74lll3zEOGUvZWZfVmbsoHaKWgoVQp7ahIraXEVlH23i3Cp7OESQ
         xEThcHgt5ygxLtcECJLMXIhLxmd/2Cky+FgS85g241Yl9UtGCXtvFsVgYQ10rylpN2Pr
         aWjRoTFy/0idMKtjPrTo7UcoZEvTxUCz1QUOloi+cthFtCGK0Sj05tqunF4ZlDDeGXLk
         JI5w==
X-Forwarded-Encrypted: i=1; AFNElJ8Wz408g/wW9WIA4cBzTnoAoVJpgX2iLGPSd5KYxr9q+53vXur2tuqHwKtj/0dw+KZNxyAKErKAV+wA5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9LGh2zXF08XLzB3sWgFjkLHRIQuv+nHo64CeFYt48VS6ulIf
	PDjlITgR91KSGVClddAq4gABdpx7GYgEkyopyVBf6BiQxk6KhPAvcQ3e
X-Gm-Gg: AeBDieuqhRuCDB2GbUpEx9TnnQjtT3dU5v+QVgvxcJPOsJMFrpMw7a/n7xbW8LgdAvH
	VBdfxV6JovP/4KtGPWsdZCRMKV02zfflMijIb1z4olZ70XAs01M4wWHHg3Gy2UhZMdfDVyZyqWW
	Eg7PDiMUhkKW2wsoSSCNrcipwbN2YOMWoom4yWn2CHQ5OJ4XS5Lcqrbm8KTL5kqTV3RVVP9RKvm
	tm1/hoWXqOYKt8xY82mII8MelQ0CHA0tfgB/JhYBAcUxNHK05gAI8jOUGRlZff3llc0GT2LQK/a
	gjhJ9/kWrsd68pR5CkEQoL82KWX04U0rdlYWfIj0JihKQ+SO6LomhSWh66jCiLK11w5iSPRS5d1
	bCm6uAZnQAwXPpeqJBkXSdTcNrsDi4SA7S9uqnxPzKy+hq9nmF4hKzDWCyDF+U+NL9tkLZUiT/v
	cvxk1UMUVZ6AJB6HBxiF3d7w6UB/MdZya4BAUKWWRn08KLJEIvAuh/XDNcAHuakuApRzNgbV9bV
	QXgS/Zwn4Ul
X-Received: by 2002:a05:6a00:35c8:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82f0c21a67dmr15179437b3a.17.1776115712114;
        Mon, 13 Apr 2026 14:28:32 -0700 (PDT)
Received: from FoxArch.wyvern-exponential.ts.net (184-155-120-110.cpe.sparklight.net. [184.155.120.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b2455sm12398165b3a.35.2026.04.13.14.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 14:28:31 -0700 (PDT)
From: Faye <faye.opensource@gmail.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Faye Nichols <faye.opensource@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Acer PT316-51S headset mic
Date: Mon, 13 Apr 2026 15:20:25 -0600
Message-ID: <20260413212645.117119-1-faye.opensource@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87lderwhfi.wl-tiwai@suse.de>
References: <87lderwhfi.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Faye Nichols <faye.opensource@gmail.com>

The Acer PT316-51S (PCI SSID 1025:160e) with ALC287 codec does not
detect the headset microphone due to missing BIOS pin configuration
for pin 0x19. Apply ALC2XX_FIXUP_HEADSET_MIC to enable it.

Signed-off-by: Faye Nichols <faye.opensource@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index cb39054..a8dbb0b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6690,6 +6690,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
-- 
2.53.0

