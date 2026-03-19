Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B312C11E8
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930739; cv=none; b=AE6sSi5T8zMMuoyCyVwujbxWKm8z8vbphP0n2/8jrKnqFViaCuuuRDLHsxkyHVJNYS+FB3n2VNhEXyH9ptl8XGJSBmlZpqppUVSAFCxXvh8YFTNXESSQCZ8+v2etidBF6VFeV3A4WOysL76Mhf/gvNcAODmrYiiux31RygOF0rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930739; c=relaxed/simple;
	bh=q+S5ES5FQsE9Gk8NuOUQ7hOwdu+go9yz3nS4YVUwUBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhR5krzb7ggBw+Igl+wWiOYX2QuuMVcHoZnCYuVCEZe8qOMULv2YeCKgSgIKadr0wqRjAsGVBh1MdPX6tNV/gSi0SwNrEbZcS0+UrN9hnB8/iFNiSL8EjPSw6QMi3Oz9c/rJPTq3RfXPg9Mlgn3QJX92acqqLxlS1UKG0Ikyb5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOxWzclx; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOxWzclx"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66732a99928so1228672a12.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773930736; x=1774535536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs6CN4UZfiN+YbTjWcbMDXxGm414VlrghDBLNSeP1E4=;
        b=hOxWzclxuQoqtkI+bYHKuOx5d4/xft6UJzerKvLBYzlULY1WAt4gmtY3KkYqJ1/VDD
         7yh6FCeY4Z1ie8D3gkjJ+otBvuFl7gi0O5vFbx9BZU0i3N55Q8Mqd6xI+7ogNWAmdPMk
         MQSnq5duSSCv56dOPNYfKCea3inoFRMRXTEnv+23BnyndgeALXKi/S1tY9mnLXjeTC9B
         6iSdgA7nvf6SmV2MZPGDSbbpqIEBN+g84/5pLKMgJdH9rf4oLHoSv3VNCDsTD/A77KB6
         x3/jF9vCyO9WZ/ow208MInnf61TMVvc17yHVUp5yHbMLzYfGElJ06zpaiz9Vhk2VHa1y
         t03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930736; x=1774535536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rs6CN4UZfiN+YbTjWcbMDXxGm414VlrghDBLNSeP1E4=;
        b=ou8TdbBVVBzQcl/q1W3FPt44ShEUGnRiEVfc5zUksOM+SRDcz6ebpjx7CIB9orA9xX
         Z0CXyM96FTnaSGnb3s+Yas9v3t2Yne33xaXFRsDOSOwvQh8cVQulAeIPJeCcThyDwfF4
         fByaBNsLSk1b9EyA6q8lTHZzApnoqtXiTXVpfGbqfM0c0mgogSyL5M1+bhxDQCJooNf8
         F/q6qP3KhobgjFRutbdOi2FYuh3I1fqFkYJgHIQVRZx+YoufOY5/G4W+J9x1Ax2gZ08/
         m1PBXaB5+DFL+K/uBldIPIbHsRBDCcmCToTTp0L5EXeHdCq6+6CcaaZP32HyxW7Uy8PP
         voxA==
X-Gm-Message-State: AOJu0Yy05QJ9wz9Iih5njwFIey078yCdYIgBOVuUiAHcdysbqFKRe351
	a0ZEmGjZO/NnaPde0lA+WnPNkLv0ZpWzAudUbzhD0GofJJPfNdrrvsc21H8sOo6T
X-Gm-Gg: ATEYQzzpP4bzn+3V8y1N4CxgIpeonCgRZCk9RziRXI1opf/OKuyykML3dpQJrl5gKWl
	duTN2jO0VXlAZbvCzFAKdwPXVmJ7vHB1Pt+MueVq13B/ZKKdKg6KUaa4ENtkDkGRr+YbTHJyWQf
	qtN3yk61QIcaUC5INCPh5oSyV3C9j+sfXdZ/wdPfUHJTk+ah7D9ayD1buHwBZ0azrQo7wxKd18m
	Zvd1m3b+4aIdlL8qMUtmXDQzgiF+KzIaQU9MVmJqaY11Mae9xb9bQhzhsfr1UCq3nFvoaNBpsst
	tegBMrK9+D17Y/j1bBPvxwzNyGWSU3IAU21eeyoQlt2/uRhicoC8KVCFkGnPctpMxRftgc3gm7s
	mhNIrRMg6VvmjCfnRHBFZWRphPjGZ1/5Uzr9j4lK1nwcEmRvL2/LD7Ch3L3aKZbGHoT6csoTuQZ
	ROs79Wio+zNjG57Bv+OJJeDCqgas+Elg==
X-Received: by 2002:a05:6402:23cd:b0:668:8569:c903 with SMTP id 4fb4d7f45d1cf-6688569cb3dmr929535a12.20.1773930736048;
        Thu, 19 Mar 2026 07:32:16 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b12adac3sm3620051a12.29.2026.03.19.07.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:32:15 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>
Subject: [PATCH 1/1] ALSA:usb-audio: Disable Arturia Audiofuse 16Rig
Date: Thu, 19 Mar 2026 14:32:12 +0000
Message-ID: <20260319143212.149090-2-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319143212.149090-1-willerz@gmail.com>
References: <20260319143212.149090-1-willerz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's an out of tree driver which works for some use-cases here:

Link: https://github.com/WillerZ/arturia-af16rig-driver

Signed-off-by: Phil Willoughby <willerz@gmail.com>
Tested-by: Phil Willoughby <willerz@gmail.com>

---
 sound/usb/quirks-table.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index eafc0d73cca1..728a2a4b5566 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3541,6 +3541,13 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/* Arturia AudioFuse 16Rig has an out-of-tree driver */
+	USB_DEVICE(0x1c75, 0xaf20),
+	QUIRK_DRIVER_INFO {
+		.ifnum = QUIRK_NODEV_INTERFACE
+	},
+},
 {
 	/*
 	 * Fiero SC-01 (firmware v1.0.0 @ 48 kHz)
-- 
2.53.0

