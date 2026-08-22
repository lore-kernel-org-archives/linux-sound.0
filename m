Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6F355803
	for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 04:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787373057; cv=none; b=EnTSUZP1lzueweTTJiCoiBtaevgv2aSZQYflKaHG+U463yl40Xr62fXyqXbXfu8qATEKS0PZtPES6XR+4PZuHAnqkFX4jyuKyOf+lX0NsZJKGANtvZB0M88L8uKUh7ymVgCDgmYwoFE3k53QCfSSkJfhemA0bHMNqVcxKsrTWxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787373057; c=relaxed/simple;
	bh=TuPeNSioNGFNeBJIjxdGzbO0QXMYUhpncKOvygFo9fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyiEQ0ut/GGR3FqTnfdF6pxQuEW0YoD2k8liExSwZR3R7DkqUaooHg+S5GHqiWzT8kpT9JD0F0ZOoBOKcL6qwac7Hq20/DkXy99of7s7Da8O+SHD37a7CMfvHNPiWjGJdL0BVI3RZSumgzxSVooXhcPySwivp6JXaHuERku/EbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=PbtmK4sr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="PbtmK4sr"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cab973140bso22759995ad.3
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787373055; x=1787977855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Igex+Arq1dZAWYBu39qRLRTva7FBhoZf/h4nSlRMFfw=;
        b=PbtmK4srffWIkLUtFbh4k5QNpW2XWH9YBTLlj9spulkjnHyaEM5VJe1x3meZUzZsRE
         rnaZgh5/mtO6P7+4tqwCv7Db4zv/BataEJZo3hUjW8MJbNBay58TaAV+ghW+C2xFxpS9
         GXXmrOJt6TRvemhkw4DEwj5Cff0nNHGi9IrbGf65OYiXIvqAqyKrY6l9Je2R/RjxlJyA
         6roJMBcrEkBlaqWqI3AMBndfBpQYbH68oTnIgtJP1Jys/oTnLjuz7qhCY7PX19myLpTq
         9INE8H8VaGxpdHtQ7LmG+nqYdMWD9cm8kS29MZ7KR3/uYGxYKJdJW8jQThATIilO4kb0
         xHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787373055; x=1787977855;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Igex+Arq1dZAWYBu39qRLRTva7FBhoZf/h4nSlRMFfw=;
        b=Hr5TR4Ng4Ja1s+atr2uaBXHwBqX//6f7OCzlNTXrJ51no1cBcBVLSRLiEvqQo2eFNZ
         xEPhJzsacV9IAUFwOmpBRK6i1S4nAa/Ty5cn3twD8DRlGaK/e2X3XUlXwre3BkSO0FCl
         /Wy75Hxs7Wo9QvCpM3FMT0KTuYFFb5cZer9rqYzcvuZj/WjRTFURb4XKdmuQ4fJcCukF
         TsasSGwQE5XpPCFnDq7BrG4AT9g2EXSa+FEh6ioP4Xzgk9j/vR2CtXDW7ESfjQ01qE5D
         pE2wx0IDowRFiS4BwK+5hLzBz72WfxA+No08+W1CI4obk8jubx+zP4bCrWQsjOBGoUa2
         Evow==
X-Gm-Message-State: AFuF++n247/oCCUlVjqrQinzCMiRAfK9VphYZVUyYsso0KzYd20rFAQt
	xx071tY4VjPYEillNoqjJFANn8oq5fEOl0p+d1YbinavA2dAWOK7v080qLQ8Es4WivvSh8zpPfC
	VWIGvG76TPQ==
X-Gm-Gg: AR+sD11BXSE0k5XJkit0KZjBrFaaD9azCBFjAQ34NmmU0BTPIMKAGnmDoEBINWpl7oD
	Lh23Ki6xEjkm+RiT6yctlM/KIEqu3+UvwG8m9gRwzd1drrmj4K4tU2uz8kJl25BRYvuGlNet2xm
	9OfWMJWjCVzaXR0Ipsx7+S4fZAvWoF1wMpv5YDHZodRYnBJEUX9bs63rQonB77eLewRz+5I2TWh
	yWCGg+NzIAcG1oQAE671/iKritJj2BwW+Vjf1GrbkrqPjfBPFaUK94WEQvadnpddw7YiJlzHinz
	zsbze0W9qc0Ps8j4kZqfEqPPfHuW0vljBXBXPAI0Wudk1lhNFbzT7nEDj9enn4Dz1H4nIE2AWXV
	7zl9d/7/Thl/cxt2/y4tsJmOhJGlqfULyEUNTPvjko8W0mKRaaJ+7QoziK5fTXxqrOs7Nvo++pJ
	qgkldk6BCDQUYv12hq9wCenQtQw/NIDUkF7XpG5GDq/UzhK7Um80DLVsEiJNO+T5I8WQOoYrGtW
	5u2itldUXYVI0awP1ZW9354ag==
X-Received: by 2002:a17:902:d48f:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d670b85236mr35467415ad.4.1787373054643;
        Fri, 21 Aug 2026 21:30:54 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90cb8e3sm2600432eec.12.2026.08.21.21.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 21:30:54 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
Subject: [PATCH 2/2] ALSA: usb-audio: Skip mixer creation on M-Audio Venom
Date: Sat, 22 Aug 2026 01:30:33 -0300
Message-ID: <20260822043033.529424-3-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
References: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The M-Audio Venom (0763:2084) does not answer any GET_CUR request
of its feature units, hanging up the USB microcontroller and
"responding" with timeouts. So the mixer building lasts around 47
seconds, and the device does not stream at all.

The same GET_CUR requests issued through libusb (with no kernel
driver bound) complete correctly and blazingly fast. So it seems
to only happen during the initial probe.

I defined an explicit composite quirk to bypass the mixer creation,
as it is not needed (the synth already comes with volume controls).

With both this and the device flag applied, the synth works
flawlessly.

Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>
---
Tested on 7.1.8-arch1-3 xHCI (Intel PCH).

alsa-info: https://pastebin.com/Kf4SCkyT

 sound/usb/quirks-table.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 0a3d39b838..dd02c6294e 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -1814,6 +1814,28 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * M-Audio Venom
+	 *
+	 * The AudioControl interface times out on every GET_CUR request,
+	 * which adds around 47 seconds to the card registration and
+	 * freezes the device, blocking streaming.
+	 * Using an explicit composite quirk to skip the mixer entirely.
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x0763, 0x2084),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "M-Audio",
+		.product_name = "Venom",
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_IGNORE(0) },
+			{ QUIRK_DATA_STANDARD_AUDIO(1) },
+			{ QUIRK_DATA_STANDARD_AUDIO(2) },
+			{ QUIRK_DATA_STANDARD_MIDI(3) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 
 /* Casio devices */
 {
-- 
2.55.0

