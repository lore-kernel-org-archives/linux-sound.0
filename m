Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FE430F7FB
	for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789839476; cv=pass; b=Ptatc2LcdHVWzJwx9kXKDdZOWQdnCcpLOzALzSUX8PhqJMETf0OHAIOWQXJ6YBmfKXItsVHGQpA2sWzIYNDgyJTG9E3kUEWMYZgngIXdEFXJcnO3GHRnVb10sg5ZWLfP0cJl+gaV9nb9FJghlXSbb0Lrch6WKkVK9lo4HfqRS3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789839476; c=relaxed/simple;
	bh=3M3Ly8PtfuuDQudfR3+28sw5EfN2/wDbZ9K6hoePcXE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ovuvat/ZkE152F2j4TUItkN9bDXeNPZYyewk1AK3HZ8f9PTO3+vhIVIdPSsKNS8e03yZGuiNq6izo5emFsnQg/YYl4y5+8T5HRLE2t9ZGRxDy6mjfRcXApz31V6dXmT8i5fCwgZFlAmpshpHoaXSTxQA75eEm2DGzV/O/m+j9tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3cqfnVL; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3cqfnVL"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a36887bso976503b6e.2
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 10:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789839473; cv=none;
        d=google.com; s=arc-20260327;
        b=asNOsZS5lo7JkCwWQEp3vdLxn502kjG6Tzd2p8mt6HG+O93FnXszmxRWcEWYQKIvb0
         xV+TWx8WFslykcMzdhZF8gCVwnfe0Zc+qRjzbyJSLrTuDUfvVbyMGPCl0offNdvRXtxx
         6fIIQifbg0Z7yxQR19kOUS2PrPSwGUi4aQsIVHxhylf69LQSxqONnpODVauBYRMVubp/
         UZmRBD+0l+ZtrO0dlbdB08SWj/timmgt0FsVlmjZFNlY53i1LqRp5Qgreg2I2Zi93+XU
         RVUxyAilGt4nLgE9vr9JTmfNFc1VQv6sqT9O8UP1SXASU9VYNV9eDieFqOe7RuVm3DQq
         P6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=urXzmInWVRHneRjWpEj4c3oyfAKdN4ZIpc92YRdUpZI=;
        fh=XP+86SuuTInMcKI8+0dTVoT3DC3lJDXHAdu/2ISOv7A=;
        b=FLALIL162MNGlLWEjT7dOMWosfFpOjIgYEdLcLT3yfoUma6Z8OfWsdQ+OsxoBuocjp
         rnBG5udtlOFWcUX7rMbTClumxJmewEU1c4s6XDSP2i0rGngHi6n+iNaipU2zXFbutT0H
         mJITI8qK2AGkt0rxsOoygHkQDyFyq/7MFk3Gg8nw3puwjb7lFn7D0By4qtci4lqq8Nnf
         JkSBzZvuE9GK1hhPjXZKDl5EiH9rHKTFKer/AsRn1c0RMdgaxmbgPuj3iCq2Mq96XMqo
         7ZeZw/8wk7CiI4ZwfLwcnLADTMrKcpG3C/F3VsX4NbY4IKwcyMbKIJdazhTVxjXhTFni
         NHYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789839473; x=1790444273; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urXzmInWVRHneRjWpEj4c3oyfAKdN4ZIpc92YRdUpZI=;
        b=J3cqfnVL9RD+0cki21EAZttOH10vGBFnFvC/DByMmpIXEt2A0kRoMYRbTRrxYskD5b
         61kSYjS4J6uitlRBYgN9Ol6s9egI/FcujXizg7FHkx1F0yCP5zU19rEY+rpgAvsdcc9T
         dl0jmmAGCm45L+PPd2lBIlVNnYHyFWGHLDWmvnntivrnT3m4sawxy+7htB6LqMIG2PoX
         E2O+ZD8RySmGIoXNDTOsvf4C/a1c4xRO2rg9EJLzdjVckbMm5o0QxbKEXSM1ajT9G6uq
         SaYBPaYvlGDGvZFKSKdifpRoZr3cJI84TgM3k5x1uQD049F4v1rkXNk1yiSvGyZr6Y5o
         Mlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839473; x=1790444273;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=urXzmInWVRHneRjWpEj4c3oyfAKdN4ZIpc92YRdUpZI=;
        b=xO6G312gRLN8v/W/wqNJQobtKv0hIrlddT5aIM8UtYx0ZR3DIL7NPG6w8wUQajbB3H
         QgXxf0E5ew7QiRXurDYhEt0PiQGDv/LWdj7oYvE2GeOgp1iVaOPqMetxU6KOQ4fZgEMb
         qAmumYeGzjtAy32iCbN96Sl6JQZWrofFGTRcf240DnvPYMCCU85YgTBvS1cB42v8LFF3
         pDYeVzZDSyNcUP7nZ3WaQiCcZXN6AiMOVIclPvu62rHElchpHNOgyq8a0raDat3eTPxg
         QwdgUTpRU/PP5Z6c6BdLSM7uXomfQH4dVdRht8Cjwrti9ZpA+Ua3qccB1qi8EAsxjjJR
         n1aA==
X-Gm-Message-State: AFuF++nBryaXC7Jya6jbenqkS2j+6ti2X0IgGWCW4+QEgj3O6yqqhqIw
	gwcbtS/7+QrqBkNoEoWdM5/Nk7JHSJeVAVKVpsbLHcOn/LRntWbHvVYqCF9KFpkWXiIm82c+MCI
	9qUvpLAfc0E0lDK61bIXgR8tc15UZ9jg=
X-Gm-Gg: AYBFou24DITHayAj2NrlgrASl3HIWu25QQcCMvNv0OTR6NFi20vmWWARcOCeRhDnjxy
	2ogdffmbsR2uEqdUhB9MLo7991tZ7URVBjA1PyDQgNYCYDz0qgxHw/+w3VlVGElr9AajOr3ahyq
	h+ka3CswhLNX+HUgHnym8lRmzh7LQfDpBUBtNCIsZzj4iwVAbpwDlyKBmmswvaax2zytwi0Ix/8
	49uKOGGD1Y29U6gbFXHgy63FmGnmsXzy+1B5p+8zWnvkA/6uDGAUDBKezgxJJxdDq1GI6YL5fD8
	J5PmqH0ceiIGE/ntfi/ywpW8lGkes08Yin+eFO9bTF5sF3TAPRveyGRmSEu+PVp8njIYIH2Zcqq
	J1qlIB00cgUII4XiLoXt4jCrqxS/Dqs6ry7idXa/RzKTI4oquq9DW3k1Wy315HNd0ogwNJxBDXN
	VmrQECRAR5owVZo8ODbCwIaTMPY+DvmHw=
X-Received: by 2002:a05:6820:188f:b0:6a3:1dc5:3570 with SMTP id
 006d021491bc7-6ca9be4ff96mr5127192eaf.31.1789839473388; Sat, 19 Sep 2026
 10:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Brom <bartosz.brom06@gmail.com>
Date: Sat, 19 Sep 2026 19:37:14 +0200
X-Gm-Features: AcwNN1VoogZIq0FCgYpuaMQJlESNWEeYCUSCBaNQtgaYhZ4PzJxlUMUv0QsqjvE
Message-ID: <CAN3WbsSrR_gXGO2Dco4kBuPOw5LGAzHFJgeTW6rXYYvvjkC6Rg@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Laptop 15-dw1xxx
To: perex@perex.cz, tiwai@suse.de
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The HP Laptop 15-dw1xxx with an ALC236 codec requires the
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO fixup for its mute LED to work correctly.

Add subsystem ID 0x103c:0x85f1 to the quirk table to apply the existing fixup.

Tested on an HP Laptop 15-dw1xxx; the mute LED now follows the speaker
mute state.
---
Signed-off-by: Bartosz Brom <bartosz.brom06@gmail.com>
---
diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..bf7a20404233 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7388,6 +7388,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible
14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
        SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx",
ALC285_FIXUP_HP_ENVY_X360),
        SND_PCI_QUIRK(0x103c, 0x85f0, "HP Laptop 15-dw0xxx",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+       SND_PCI_QUIRK(0x103c, 0x85f1, "HP Laptop 15-dw1xxx",
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
        SND_PCI_QUIRK(0x103c, 0x85f3, "HP 250 G8 Notebook PC",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
        SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx",
ALC285_FIXUP_HP_MUTE_LED),
        SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6",
ALC285_FIXUP_HP_GPIO_AMP_INIT),
