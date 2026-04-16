Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91CE3B47D6
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352112; cv=pass; b=C4ldsaaZbHVlcomJMqr9jP2D2kzNp4YszQC4KHMqIqwK+p+AKWiG3QMOVLH7CxKh1SZ7e1RDXne7IKgovAEpTarjoPVqeGtIwWhZYZQbEZfoefv2/YyScfAHZd1AB8aNEffiXLcSkfIsKLS5MYQTnbclA2r/aHd5sZ8evkLu21c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352112; c=relaxed/simple;
	bh=RYVUshRkLnRVaVBk3c1Kqi19FAvzcxMeq4+HEMgpuUA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rvgRGGX9B3vYGrQ743apx0TMv+EGYCk3WMIiw/JsFSdyEDwJGdAInxeKEWFC3NiDAspXq48CBTq7kKudGY5h0PRUztJXwU6F8pWRi0KNmFE+9AMvOaHS1pXHnPIXSrOoVVn1OBD/FY/2UtvMaWJnFOat0+elc5zZ9yMeWFg7I7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdUxe/jk; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdUxe/jk"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a4053964e3so4328479e87.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 08:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776352109; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8RoXbywGwspTcEUmTA7pNeEYERpKwFnefbEpfTI/1ogZngsbj/Wo63O8DxIwKWKDL
         wNzJjUDnTdUAHESt0S+kf59RsvacmQ+9sAXqxokYuv0/yeZ8nzouzw3y4FTqMBQU8cbS
         aNpmSA646LFgTeCSESIPoR3AoNGjqIx+eCxoRPWNWsIcv0q7SuJtY2O5cCA0pgijI61s
         Q4YcP1mr58t0lHJSO7E3rnJTtwxh69c2PZVM01ULr4enl0Jr3oKJcGOPX0yQeXoKxMTX
         1F8dj7h4eD+i5Dp19M2PFJR6YVZaN4M47DOYMcNdFL9N5CYJ956lUC1T9vuufNLQayX9
         HQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BPPy8TwnOJ1YG0crnb2zjkierTy8xTP4mFky6SqpEmA=;
        fh=KH/eX7jUCHca3rYS8rYf76YoNF9c1GGVCnLDYiBbPlc=;
        b=htYYJ7SINf6fYr1umsuEcKWKQPopIKMXrdq30f2jOpwmHp6GDnNmz6v9VBjUvQcuLA
         XokDSLHJ5tvDeHKvvZOaUL5jctbRHEZnHpuyWDTTA3kL/VYEUaOrFBSu8I7DWeGv+Fkc
         OBfwo4JRBK99E0O1lriTf45qu+0en9Y3XiYuCPvOoqb817t9f1MBaISwu6qzbx+Bu81n
         yydIvR/opBNRm0jwIfpRlRp30XvkLYGxBMtobfxS4dTht5KKqbjkUHTpcOLodDppjGVD
         LaLLKE/Q4siGd9MJIH5JkH9e7LhPZL0lGrQr2NemfQ6orw2D6vtKuhZ0O9PMLwKRGdaF
         BJEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776352109; x=1776956909; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BPPy8TwnOJ1YG0crnb2zjkierTy8xTP4mFky6SqpEmA=;
        b=DdUxe/jkPf124bVqbJ9tqtey5+7fyYd6ACaekZ5FS5izAteLkvw76vbUWFLCQlZOCW
         wqvjmqUm2Tvdgx+C7rGaEiFceWStuB+W0Kmkekfp4+zrLIQyk20Y/UunNg9/kWbbUIAR
         UDIiXd+EsY5YwEzFq7EXL6lSGjSbJPtP7eS+tRxRa2idox9SVdqG2qOlVTINO9yX4gm1
         0/c5/vDe/f4qrnEd7cndyK3TFGIQwg0M6nolVsv/Wbn2WLJM8A+peMetxgltHDgAxmrY
         hlFnHEgoGr9y95Qj/pPgHEk9UunATsCKish2oSBYjuQd9csk3023IeZREHJeXv+0amdh
         x7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352109; x=1776956909;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPPy8TwnOJ1YG0crnb2zjkierTy8xTP4mFky6SqpEmA=;
        b=TfC4UGDMfq/2ldaeCdYNkV2VijJ/FEw5ClRn2jvJDGvZrNHMlPDWIih0sbtgRCgTuT
         9J6itd+rajUIR1qge3MULb+PuuZhypC0VBAe4zyNXrhsdg6dv6N4mf2DH+bnAVBd3Ag8
         WC+40OWDn6NcqrogLE5McG+1zSoDC+YKdoK1NztxRDobpghW7ELW015nAIulBdtapULS
         uTCbDs/GFhi+7Ol9biz7H9yB0CT47psvC3KlhJseeekqjMx49dOetkANBh+Hu4JQSC3J
         Kq/4UOUbcyuyfQZumFfjzP4N3PVFo8Fh80vqqYnm9E96iUx8zl1cJP6O8JpWpK4OaxLo
         gUJA==
X-Gm-Message-State: AOJu0YxlunnZe1B455efdWu6DBYSGixveAafwrs3G6tiTQzLfoJs2AZL
	JQourCMG65C8tSpzYOo4emlGn9SlVdjY5FCJVUZLeYzOXtwPL52eD6ctURvcyK879aU/SwEntC+
	I4c1zxKwdf1xLMY89eIQ65QNoBbjLQ49i5N3NvUk=
X-Gm-Gg: AeBDiesuEW+ZH0tlzTPnZ/XoQ4moZy6d74ztXw8ctACqNlW+Fobf/AXiKWn0YcQjT/b
	XewsQyXMEl1HfUff0jBJ/oFvHqrr1g+/c3u+pIQEcQ2i9lJ6CfY0Iig0K3T6Bn0sdRZpbjzx5Sa
	0EUH/BjdEP6quDuGCgeEHa6vZ2dP9khinYNcIjEXCe2DC0kNuReCXue9/7mVM1bNZvxYhCAK1bD
	A5gzgYlbUlmi6QVX8k0V1qgMWgf7TQJujA9tVw7uesEnKw4Ql9hgEnqF86xXkqF4/5Jf5TaClZd
	8uKdb2qAkyzALarUD7q76uo5vpCE1PUyiNgflvvXUA==
X-Received: by 2002:a05:6512:158d:b0:5a2:c7c0:7405 with SMTP id
 2adb3069b0e04-5a3ef906760mr8891625e87.14.1776352108274; Thu, 16 Apr 2026
 08:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Juan Pablo Fuentealba <jpfuentealbabizama@gmail.com>
Date: Thu, 16 Apr 2026 11:08:15 -0400
X-Gm-Features: AQROBzBSzQnA5s7Hz4SbOm1iRfyiZFpBeGwiyyUXHb3VHtRKRBFHRUYwGtjtZJs
Message-ID: <CALB_=sif39301fM28W7tkcRmAmwKeixaHGA=kSC6BS3ap4Netg@mail.gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"

From 782a75f5847b23659af978b7b61325205c32c947 Mon Sep 17 00:00:00 2001
From: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
Date: Wed, 15 Apr 2026 09:16:47 -0400
Subject: [PATCH v2] ALSA: usb-audio: Add quirk for SmartlinkTechnology
 M01

Add quirk entry for SmartlinkTechnology M01 USB microphone to enable
the standard mixer interface.

Signed-off-by: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
---
 sound/usb/quirks-table.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 803e03d4d77b..283135d880db 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3772,6 +3772,18 @@ YAMAHA_DEVICE(0x7010, "UB99"),
                }
        }
 },
+{
+       /*
+        * SmartlinkTechnology M01
+        * USB audio device that needs standard mixer quirk
+        */
+       USB_DEVICE(0x301a, 0x159b),
+       QUIRK_DRIVER_INFO {
+               .vendor_name = "SmartlinkTechnology",
+               .product_name = "M01",
+               QUIRK_DATA_STANDARD_MIXER(QUIRK_ANY_INTERFACE)
+       }
+},
 #define QUIRK_RME_DIGIFACE(pid) \
 { \
        /* Only claim interface 0 */ \
--
2.53.0
