Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED6438034
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580165; cv=none; b=Yuk31w5lkoB2Ml9fxunIzQyGYDmirGF3h7seCXOX05VLgZDfV10h6mynYOt1mKQ3tiN8Jg26/8cmJ6d4u0XQRdGqt/VhOTrcV74lTfCUPKHfEGNUCOFOkJCFIxpyfXXpHB88sBbAOU/g6EpsaIid1yxAY00TSLXjHWpmfGJJF68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580165; c=relaxed/simple;
	bh=gFwUUntQodYhgeddVFOYBo7Qp9VpQc9z4h43g2XDIMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FpKjBMBwybhIntviSWBfl0gBVp4vRyI38kCkZcjwD7J5FQsX9SIW/xx7nOFk9Mf2KBzbmFem6YvnBmsZxTTSo/vNizbYSYq4+YZrPAMasDQU0fHs1Y0wXdrLIdJV4fLDQZ/bdguHyoHQGhuCB33Nl8hE2dtcxmgC7oSh0U57Im8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=kRuscPHO; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="kRuscPHO"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f48c750afcso1189173a34.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787580162; x=1788184962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y9u+aARNWADXwd90+pDUTDjttmTqr1vQNgiDbZgD+K8=;
        b=kRuscPHOVW2QsbFOlnq6TlZNROjxKJSM0m9jr4CHL9WFeeY49gpwPDumvGO8JkMtMr
         GubtCpVA2ry8PzPOd4DneY3kFTE5fUULnhwxUVy4gvKvmlOP/mZOsCQOTVNi3mnwR+o4
         G+Fx9tjDAeDVW0bIb/Tlf/8aXmpO/dtO95/fIqrIAjWjewwDhtVL8B6MOkS49OateJLH
         blJZEbHd5W3hUTcxLGOrAf95dybGi2RCvLobyGPPp2bzikvw47Fh4krsx+zy5nRAwpIr
         NyeLgIZU18Gfbu0PO4fVWL3mXtgxHSkmvI+3OhDIk7S2kF5qnm4OmKnpkL0ZeUjICh4V
         6Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580162; x=1788184962;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9u+aARNWADXwd90+pDUTDjttmTqr1vQNgiDbZgD+K8=;
        b=BJUGhIlCcT4/2Z3xdsl7DrIYY512D+qrPAYf18M5gizz6VhzTt+5pKAo5SlfT7dmdG
         Ft4wibxhsWXCA65fVFqEuAtuJDhsLv6J3SRl1tIPzxCugQ4nBZsKuswMabWVxW3HtwuT
         u/b/AbBsJSicSR6iBUjXf6OMAt/ZZzfNnx+n4xFfz4sdakFVnZa6nWPq/BivkaRG3bTh
         06a5QEmeZEGMXQNGTZv2zPCYcucGmB0hzIby0E9elOVEe8j7QaOgoaBfXrCj89PccQcK
         fxsSvkcfBwp5DQNWdp2rGlOmWcYbm3NVBgoHVth0erYDCIPV9gWcHhJsQHsScVQEHhja
         2olg==
X-Gm-Message-State: AFuF++kXJsN2rtryE16SC0c8n5cl9Y91SBMFejoCP+5qrKDlkiqWF6Wf
	PQ7tEImajxiTuQLTpjYnNABtw2lmcM1MNAqqoQhVusrERx+/ajVV9PquFLrcCSC+nk3uJ0i+0Tp
	izHRmqFr5jQ==
X-Gm-Gg: AR+sD125ttpoNJ0QefJTXoRl37ajN4C0GgIqoneU1NJwYTM/DkVNW740ZuJmcPcpVxH
	5tiOFGRp0m8fBpL+uw47PrYbzNqQVX+GU1fodBPxYaJkbQt3jYtioTwAcSj+vSTluiAQYr76nxD
	TqqNb5dcdsdKpks+Nq+Zvxe/PaGcII8xVqKy35i0JssrZOLl8cJLLnTwxIzZCl4DfjScQuBAKeC
	Cd9L2vIMWAVJK0VUXF5C90wQfkd8D2cs6okaA6S+q28r7DUyaFYpf3Q7pKrJQ6EpFmMBn/jsJxA
	+M31uGHOWKpfk8nISv5mJPZPiG7lDIpLqF4RdLj6i/jIhsKo0cTZljZqDMEi05XIP+e8EfEkvCf
	nsdx93Iviysg/StfCDtH8yk3N8PjZSTbGtg/wXJVQ4J7sX1MwfR2UjnadM40wfeXVGE6x7BNgPp
	wepWCVGFoF5O/Dcky9OhwAjZwLwB70q6Cd3HBe4iHW7e3CIV6g1IovIpRsSHhHX3Fo4avwMywo4
	nW9go54B+RiXjndSuqegtKSRQ==
X-Received: by 2002:a05:6820:81d4:b0:6b1:5a78:b0f0 with SMTP id 006d021491bc7-6b15a78b190mr29057680eaf.6.1787580162155;
        Mon, 24 Aug 2026 07:02:42 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0de2sm28152062eec.8.2026.08.24.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:02:41 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
Subject: [PATCH v3 2/2] ALSA: usb-audio: Skip mixer creation on M-Audio Venom
Date: Mon, 24 Aug 2026 11:02:11 -0300
Message-ID: <20260824140211.17003-3-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823152733.740731-1-fandrade@frba.utn.edu.ar>
References: <20260823152733.740731-1-fandrade@frba.utn.edu.ar>
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

