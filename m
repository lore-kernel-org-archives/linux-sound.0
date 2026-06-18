Received: from smtp.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0419DF55
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782409; cv=none; b=hUIQga7EK+aEWAX4k4+aJKRso26I+TCiX4TAF3FbYOQhh1iRtk4+gwmSw45khtSauL79rQ3jAXjsSbTNMxlz6Y5KP+Tz1/eawLgdrd7V7RCWNJcWfYX6CSw2MykmkBYf890wh/8fKTM1A5zJmeeerFeH9/qzkgtZbytbi2abm5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782409; c=relaxed/simple;
	bh=vacSNsjweFgQ5E/NhfWzS8KcC+YcLYhXEFYkxfQUSa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sg2Cu048bKg1MKKBX6SPc5acOk8OHyjaw+WGPONBTYX1xaxRQhk00rf3ZZ0vGcLzPKUPfr3qNUY7J3rIGygY0n1I2ACwXDcM7LkNm/Kfc6dhDqYDSzkWYhV3AUwWtyDktHc2sna4zibBfnpgyzk6ais+4Uygvdz0hA3F51J+rVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=HbrxKOoy; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="HbrxKOoy"
Received: from localhost.localdomain ([10.65.86.66])
	by smtp.orange.fr with ESMTP
	id aAykwSL6O5kBhaAykwfA6b; Thu, 18 Jun 2026 13:32:14 +0200
Received: from localhost.localdomain ([86.250.31.108])
	by smtp.orange.fr with ESMTPSA
	id aAycwoDA7alSXaAycwkn3G; Thu, 18 Jun 2026 13:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1781782326;
	bh=xy1HZk8sMWW2gfVn8cY9cPgnnEwexc2MNBVI+qg23kQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HbrxKOoy9HmbKxGxgwPywDsSBIhgAhE2y3E4dOgmplu2ti0nSI7NvCh4nA5+MkDOF
	 LjEFIXqWELOgWpsEfI5H83DoEEYjerpNlo9nyz6fUmi+rCQeauREuTApnOn+OmBEip
	 0Omo7kpeeGKFMDJeLLE3DhJxhnp1TQ6IfKEUUzPr1pljWHXJ3ysQwQGTknOVBOOI6+
	 7EzY20QLIzSmZQro1RW6xGG9V1c7zOsEEFRsXj8Zs/cwT3awO80zeRt4y/WEqUTapq
	 f1+t5raCY7VwqWxjtNqJbSU4xc9rFYL3cj509tw0CpXe314LsufsxzgNZp3WGsK7fR
	 t3rSzQfW7tPQg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: amVhbi1sb3Vpcy5jb2xhY29Ab3JhbmdlLmZy
X-ME-Date: Thu, 18 Jun 2026 13:32:06 +0200
X-ME-IP: 86.250.31.108
From: jean-louis.colaco@orange.fr
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Jean-louis Colaco <jean-louis.colaco@orange.fr>
Subject: [PATCH 1/1] ALSA: usb-audio: Add quirk for YAMAHA CDS3000
Date: Thu, 18 Jun 2026 13:32:02 +0200
Message-ID: <20260618113202.8363-1-jean-louis.colaco@orange.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jean-louis Colaco <jean-louis.colaco@orange.fr>

This quirk is identical to the one for the Yamaha Steinberg UR22, here
applied to a CD player that also uses the Steinberg USB interface.
This quirk is necessary to avoid sporadic "clic" noise when using the DAC
of the player.

Signed-off-by: Jean-Louis Colaco <jean-louis.colaco@orange.fr>
---
 sound/usb/quirks-table.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 4e9cfff4047f..64b4b7c1bd35 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -390,6 +390,20 @@ YAMAHA_DEVICE(0x105d, NULL),
 		}
 	}
 },
+{
+	USB_DEVICE(0x0499, 0x150d),
+	QUIRK_DRIVER_INFO {
+		/* .vendor_name = "Yamaha", */
+		/* .product_name = "CDS3000", */
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_STANDARD_AUDIO(1) },
+			{ QUIRK_DATA_STANDARD_AUDIO(2) },
+			{ QUIRK_DATA_MIDI_YAMAHA(3) },
+			{ QUIRK_DATA_IGNORE(4) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 {
 	USB_DEVICE(0x0499, 0x1718),
 	QUIRK_DRIVER_INFO {
-- 
2.54.0

