Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAA83D648F
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383521; cv=none; b=Xg9fPsaPAWRWE8sOwiok0Le+NLUVRUdaNZtX3XH5IPGoJibdC0Dvg+UeHkbkZYbg0R7YawwS0bf9kQsl68casNdO5eK3h36eV1w/lkWwK9S7E35nMG9gbuz/aIKb17CXo4YY9HFavhSRgCEF30NcQ+wo4WgAr9Gu/brn4IY1FhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383521; c=relaxed/simple;
	bh=tYs2cxRyTGdf410bulete8ziZ49L87S2sxxJrI5w/0A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=uNR1Bj30+6L+/Y/IQ35/GPVZJK9E0EnaFss5vYUcTMQaFFs/bbiQ5hpgpD/4Bp2WecimXbzakirKzr5rlK9i7B16rgxbk9qEtDVDBxenvXC4Fwl7KBn9dnyPgEcgroKwaw40hpKkHTYPmsmxkm1BJcjn1nCDukLKDKioVbgotV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sne.moe; spf=none smtp.mailfrom=sne.moe; dkim=pass (2048-bit key) header.d=sne.moe header.i=@sne.moe header.b=cwiEbDwE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sne.moe
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sne.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sne.moe header.i=@sne.moe header.b="cwiEbDwE"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c8ff1so3026735ad.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 03:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sne.moe; s=google; t=1789383516; x=1789988316; darn=vger.kernel.org;
        h=content-type:cc:to:message-id:mime-version:subject:date:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/AypDIHXXi5CXKyq5GMLOTs6AUWRfjuea5A7khngbU=;
        b=cwiEbDwEGt5RKJjEal0rtGAk71kZow6MDcKbiPPOXGlnaGKVH23AWHh0K5D3yFwugq
         qDOzC8q0Et2gLhhEI+RIcTQLmgDdyzQMDAseAxI15ksTV1r4WpHfHQ1+ps1+T+5bkOym
         ibM5V0Qp5W9QLFsLQHrsdlisVRCAflN4bqkkhLUsVSZxnSxrs9WpKKgzlwZk0zw74Hh6
         U0cS7RSz+7ySDAOBy1SkYnwYAHTPE8t/NGCQBSBdHy7msYWoNdzJrAYZyiAEaHpYOqUL
         IF/YlvAKJp/uQsBOPIl/QL0goP3pOfeYuncdJIz3kwfTz1juDrbmaoaX124xXJ0Glryz
         cwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383516; x=1789988316;
        h=content-type:cc:to:message-id:mime-version:subject:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w/AypDIHXXi5CXKyq5GMLOTs6AUWRfjuea5A7khngbU=;
        b=HqaJxlO9X6vwf7QSdrHYjPqDpJXj1p48d7GLA0j61/TYe18trwLKAxwM1yeA6kg3bk
         iWlXf2i0/qTtTMcyf+XHuKXJR5S8Ia21436ycbTGcBFDX5sYs1ApEKE6yeFOQP43+QU/
         dFYR64qejks/kJJQypDyDlszXgqQZDAFXzp9xsMpAaC8TdUwOslUWbfiS+pZDuyesbIM
         323AxPfz79fs4QPE5o3UBzmieZUNlmjqNw+GCiwBMFKpWXtwV3CaiGKtvY519Ycj838f
         Dy2j0rAmgKN1wzweshx62rcEMOucl9++nw+RN4DjOvTIP2g3zwBmbcSVzugzvTAfdaA/
         hmOw==
X-Gm-Message-State: AFuF++l9TD65CIFAYLxh/Oo9/7XUoEkji5nuMm9SxA8mZ64Dd8+rrJF4
	zZmNhaJlputQKYXHcM8pGKNTi6hOspvuomkue0rfozQ41yYbkwwnJgT/5TVA+L/XZtXXrL0/zf6
	wgDcS5RjbAefnzxrMcs0S4TdnkIwGK4YmjOFR1Y1vcX3qf6T9KQvlWX6Sr+ap
X-Gm-Gg: AYBFou2FcabJQsApn7xjXw2IRzH5eIqdy4s1pqfZu7KKiPPRU3wF8FmJ2Fi0VyiAPM0
	ylwklHf2MzQG6gGfy9u1SEW+H/XpN9nsMME+1TLw9JPMtFUgCnt76ZcWWuuk5QZaVdP5UQV4S7W
	HaXHRtE4gTL7J2oM4d6ZLXUpHHiJo+y84bIMPDEMPsqNh6d4zRYUPs8oRNZZ/LX01p5ZSysgX6R
	frCUAzvQGYgog13UME6rYU7MZ1DQQ28aISuHh/fI+kYuXpnOHjqXe9wkaOXsdH8MgH+H0EdWQTj
	cFrHBd0v9QNFFJ8G6yYOg0EZQ1lsGmgwrC+1wtpEyN39C+r3Ko8loGI6Ww98HPJ19CgVdZusYau
	6ykmDxmbrcmD4M8fhp15k0tE8/WbeGJocM5oq4/mFaWwhoa3fJDMbw15NxCDsaGqN/Udlz9+sYH
	UxmirCsOumXjl9DIK5a54jF+YsEZSpy7z4bbC4jyh2FdvmE1AfJuAUMSgfv+sgV3w=
X-Received: by 2002:a17:903:240c:b0:2d8:f4d4:7044 with SMTP id d9443c01a7336-2dd6c7ca8a6mr27428635ad.3.1789383516506;
        Mon, 14 Sep 2026 03:58:36 -0700 (PDT)
Received: from [127.0.0.2] ([2403:18c0:1001:3a:74ea:baff:fe97:d2e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652aa8dsm4687280a12.7.2026.09.14.03.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:58:35 -0700 (PDT)
From: Asai Neko <sugar@sne.moe>
Date: Mon, 14 Sep 2026 18:58:29 +0800
Subject: [PATCH] ALSA: usb-audio: skip the broken mute control on AVerMedia
 GC553Pro
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260914-avermedia-gc553pro-alsa-v1-1-4c694e8b0cd5@sne.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0ygGDgKsZF6RSs4S+tEhPC3
 R11+S3e28HFVBzabAeTTV2XOSE/ZcB3mgdBjclQhKIOTX5G2sQmiUo4cFWVqy1IoxMyS9kHqmN
 3CZDq1aTX9+98vf3tr+4h/Pzu4Dg+5kyF4nsAAAA=
X-Change-ID: 20260914-avermedia-gc553pro-alsa-cce3f0a6db70
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Asai Neko <sugar@sne.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=sugar@sne.moe;
 h=from:subject:message-id; bh=KKQ65lm5gd4TGamF3O9BljYBBsGT+aIMb7Ndkequqlk=;
 b=owJ4nJvAy8zAJfZHZ3FlRAEbJ+NptSSGrOWXI7+8vyx82i/8ltrtSouc2Q+erSu/4/725jejm
 An1s7vunPrXUcrCIMbFICumyNJ5pKvwyet5Hw646PLBzGFlAhnCwMUpABMR28XIMG+7SpPmw2TZ
 o+tLZU+Ebjl02up5g0GymfiuE1ax8499fcfwz2D6piUHGzsd1m88NonzxAl9j9zHhh2803h29ik
 45NzbwwAAMNtOUg==
X-Developer-Key: i=sugar@sne.moe; a=openpgp;
 fpr=89C48A71E4EB9EF0C0442D0EFC2CA37958700609
Content-Type: text/plain; charset="UTF-8"

Skip the nonfunctional master mute control on the AVerMedia Live Gamer
ULTRA S GC553Pro (07ca:1553).

USB tracing shows that GET_CUR returns zero bytes instead of the required
one-byte value, both through usbfs and during ALSA initialization.
SET_CUR succeeds, but switching capture off does not mute HDMI audio.

Before the change, the driver exposed a misleading PCM Capture Switch
and logged: 3:2: failed to get current value for ch 0 (-22)

With the patch applied, the switch and warning are absent. A ten-second
sound recording through PipeWire confirmed that stereo 48 kHz, 16-bit
capture still works.

Tested on NixOS with the patched 7.3.0-rc3 kernel. The USB audio driver
object builds with Clang and W=1; sparse and strict checkpatch pass.

Signed-off-by: Asai Neko <sugar@sne.moe>
---
Skip the broken mute control on the AVerMedia Live Gamer ULTRA S GC553Pro.
Testing details and the rationale are included in the patch commit message.
---
 sound/usb/mixer_maps.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 69093c666282..41454cb403d0 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -531,6 +531,15 @@ static const struct usbmix_name_map audient_id24_map[] = {
 	{}
 };
 
+/*
+ * The GC553Pro returns no data for GET_CUR on its advertised mute control.
+ * SET_CUR succeeds but does not mute capture, so skip the control entirely.
+ */
+static const struct usbmix_name_map avermedia_gc553pro_map[] = {
+	{ 3, NULL, UAC_FU_MUTE },
+	{}
+};
+
 /*
  * Control map entries
  */
@@ -577,6 +586,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x0763, 0x2031),
 		.selector_map = c400_selectors,
 	},
+	{
+		.id = USB_ID(0x07ca, 0x1553),
+		.map = avermedia_gc553pro_map,
+	},
 	{
 		.id = USB_ID(0x08bb, 0x2702),
 		.map = linex_map,

---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
change-id: 20260914-avermedia-gc553pro-alsa-cce3f0a6db70

Best regards,
--  
Asai Neko <sugar@sne.moe>


-- 
Asai Neko


