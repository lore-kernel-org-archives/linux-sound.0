Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142200;
	b=I3DxD8PgkKKhCSPbBGpfkLiAwTo4W4xm4Q0Zuekca9fPvu3+jV12bE2VT5bTiKDCgN2H
	 Zlc3LR2RUK8saBigVE+R8eDz4FdzYRraUpTOHEqW0DyRCtUugqBZ7BhcVHRU/CohIqYPf
	 NcOXlsdwUVZps6JX09p8t1sFxG6mD672HyvLymrubSLUg7zmWvtmTos1bINIu68UwS+rD
	 sMaTm3P96bX6G/Z88cKBeIOe4uVUuWRD18AvGCt3J2of53t6F8zKvU90mWXPIvjLW6KQ/
	 dpPmndXbOChcmgl2KWvOadubydRy9NZCF6k5bwQBv6XC2d9abb1krDB2HuhBLNfDvtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IoQo8Ev145zYNI4sJvqMfjocFsM1lzUVt+7IcsLfNeI=;
	b=DDjvKj++yy0yE0zq9jYkoIEXswSGzwBMHrWfIcGu1SGejiAdHUXPiutD8en5jVewpVCD
	 7Om1WHL76mXU6XKnDB2QzuMoX1WcmmSP5DvQOeMqumtn7sfjn1MStt5SdNB+/DsVyNsUf
	 +h1vYg2k+vUQrk+cFYSNW45EU61flHnZrzlumJ87upPJSHIB2RQ5VGajfte0mYvxx2YmC
	 2lc+HFTHXvhfkXF7m8iBtL48FLcOPoFII7FX6j4H2n0e4JMRhY5KXy/3txmGbLo0FfJU/
	 4UPQJiFmvhC1hMOkjPsC2joOSC3k4zfz4fpUBBUDFSX0xz/tegQhO2Xhc8e2jzJmCAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLBr7vtG;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09EF606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 12:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLBr7vtG
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso151918eec.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 04:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142199; x=1794746999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoQo8Ev145zYNI4sJvqMfjocFsM1lzUVt+7IcsLfNeI=;
        b=lLBr7vtGw530+wSxNKJt1/Rzs4ZWTAXW8Gk37acorxBOvVrfjgLEr1lWuz0YVWNPab
         uJrAAAZ108ffE05Rg846q0OpNwJi+PUPWy4aGiPaGCmSQ6abvMABNUiKRSIN0fr9ia5a
         jHR674uy28Re5cCriHy7M7G7397l/E16ou3wg2FuDdtv7ST30nQ4O2X3M2FTS0lNF0A6
         qmL/a2iycOy10e173BwAN5dNGaFzcgg82hjm3ynN1NfWddQ9xTSyx0U8gEJAcNp/5yiU
         acD05jL6beHD+iuH63mbZNUhiB9OWEF5E4Fz9ky16doz/Mu0sq2NrNLIpuMgf4Rp6Yak
         874Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142199; x=1794746999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoQo8Ev145zYNI4sJvqMfjocFsM1lzUVt+7IcsLfNeI=;
        b=VheuB6OX72BcAngvmci7IHNYbrPfcZ2aoKwIFqWSWOUpM4t53c3KdF62D/Hu+vqVg/
         axGbyfk7hnYqdc3e6fporW0PVWsbvZCtoYykkBiTmZzBzH/mc6FQEo6yEaHhak67Zx7c
         jI3I0aexAC/yxeGg7BieW6M3Js2WcP9kr0IK908MkWVrrjourqKyM4E80yFEBdV8beUL
         DH/Ys24BamBtZTS+PFRBdd/il29tmi3P0V6eeZhAA58n0k9dPJ++BlPXktIjofPoPuPs
         ogqe4SSB8kT+g13iXRxWOdpXp0fh5OvdUdrnOVszHoQmK9/5F5JgJVjgMR0ywzYwejgD
         3Aaw==
X-Forwarded-Encrypted: i=1; AL+hErEc5hASAuo2ivBoUspRlxpr1I4NcZxEBeMHvbbIH1V2Aej0jT4DLDcuAfbHiF4fGY/P/dMUDChogK6RkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dQZLJVyUHvCv2T+o7o/iH8Iaq6Rnv+3syRxyFTYt16mzpK+PQ
	9HUpzZSda0sUAQSlZF9vz/LzP8LtLeY7YvY7KTrcASEGElXXiZDA1g4okzRsXiZF
X-Gm-Gg: AYBFou3YDQ+mqMxyHLEbmPpkkm+3jqpGzxQS2so0dKjjFH7khE1FqSN68TZ5mQ7jKXg
	0tzoK788F/moK6ENlo7rX3GC3BkqOc54jjjZkPEreOJlx5gqKOP/zxJUA6t8LfJ3ohKL9ImndAZ
	Be5oJSXfuOSF+UebZd8W7KI/cFthIOpJwt7NZaPhNwDsiXcXnqi7THPq6VGlomGk50Q3ht5kisT
	zXAtcwjWGs/x8hqXjR1iUmMdjJBpefiz/ynjGusg9qXxMM4oZeiymGyEHL8DjfGS9dhFfTOL8L3
	m+CVlljNnsxa/RM0X/QB+aTpmA7LbGZ2qIhwL7H6MOp4uO/3NqeEPr91ynpypgiih/6y/nAJ5J0
	OXMefDxz95/pc+xe7q/soLi5JZ5TSf9+s/cfV53PWv4K67FDorKBgZi8dG1/0jH3ttL2kr2S/CZ
	70W2qAcY8DAOHLyfCJEhoWpGua2GI49ox05ntCtmcNcELWJ+PwYsAmKPv+tHb9+xGWIXzUDHdUJ
	syjvvKDsGi5dPflHZ8lSrf8tgLmWWm35rr8yMS1YKlkxZdIGm6j4M1M9MnV+WfW7+NSra34wN1J
	hHCfaToruPDiT0KeL7K4TrbqHsD7qpulegHURWvRiNEFSb7lNyNBPnRSY6xfJlHSKmFKKBwZzCD
	AadZYNOI+8K6HkjgH7QWwChJs8r4qqZsTFf+xtEwV
X-Received: by 2002:a05:7300:f788:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-37256038776mr2762386eec.6.1794142198756;
        Sun, 08 Nov 2026 04:49:58 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm5623975eec.8.2026.11.08.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:49:58 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] ALSA: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion
Date: Sun,  8 Nov 2026 21:47:50 +0900
Message-ID: <22377a352b928cf3db750c32daf54250fb9477ff.1794141913.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794141913.git.sammiee5311@gmail.com>
References: <cover.1794141913.git.sammiee5311@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIDI 1.0 to UMP converter keeps the RPN/NRPN selection and the
Data Entry values per channel. Since commit e6ce8a28c768 ("ALSA: ump:
Transmit RPN/NRPN message at each MSB/LSB data reception"), a CC 98 to
101 also sends the pending data. The state handling has a few problems:

- Data Entry after a Null RPN, or before any selection, stays pending.
  The next RPN/NRPN selection then sends it, with the number only
  half updated.
- The fill_rpn() clears the selection after each send. A second Data
  Entry for the same RPN is not sent and ends up as above.
- A Null NRPN is not handled, and its data goes to NRPN 127/127.

Keep the selection after a send and clear only the data, and drop the
data when nothing is selected. On a Null RPN or NRPN, clear the
selection and the data but keep the 7f/7f numbers, as a MIDI 1.0
receiver does. Commit 50a6dd19dca9 ("ALSA: ump: Explicitly reset RPN
with Null RPN") reset them to 0, so when the LSB was already 127, the
second message of a Null selected RPN 0/127 again. This follows the UMP
spec (M2-104-UM D.3.3), which holds the latest RPN/NRPN numbers and does
not translate an RPN/NRPN Null.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Fixes: e6ce8a28c768 ("ALSA: ump: Transmit RPN/NRPN message at each MSB/LSB data reception")
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/all/20261104121508.3972314-1-sammiee5311@gmail.com/
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/ump_convert.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index fe7d3ee3c6b1..2f19efdc31fc 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -288,13 +288,22 @@ static int cvt_legacy_system_to_ump(struct ump_cvt_to_ump *cvt,
 	return 4;
 }
 
+static void reset_rpn_data(struct ump_cvt_to_ump_bank *cc)
+{
+	cc->cc_data_msb = cc->cc_data_lsb = 0;
+	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+}
+
+/*
+ * Deselect on a Null RPN/NRPN, but keep the 7f/7f numbers as a MIDI 1.0
+ * receiver does. Otherwise, when the LSB was already 127, the second
+ * message of a Null would select RPN or NRPN 0/127.
+ */
 static void reset_rpn(struct ump_cvt_to_ump_bank *cc)
 {
 	cc->rpn_set = 0;
 	cc->nrpn_set = 0;
-	cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
-	cc->cc_data_msb = cc->cc_data_lsb = 0;
-	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+	reset_rpn_data(cc);
 }
 
 static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
@@ -316,13 +325,16 @@ static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 		midi2->rpn.bank = cc->cc_nrpn_msb;
 		midi2->rpn.index = cc->cc_nrpn_lsb;
 	} else {
+		/* no RPN/NRPN selected (e.g. after a Null), drop the data */
+		reset_rpn_data(cc);
 		return 0; // skip
 	}
 
 	midi2->rpn.data = upscale_14_to_32bit((cc->cc_data_msb << 7) |
 					      cc->cc_data_lsb);
 
-	reset_rpn(cc);
+	/* keep the RPN/NRPN selection for a following Data Entry */
+	reset_rpn_data(cc);
 	return 8;
 }
 
@@ -397,12 +409,16 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			cc->rpn_set = 0;
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_msb = buf[2];
+			if (cc->cc_nrpn_msb == 0x7f && cc->cc_nrpn_lsb == 0x7f)
+				reset_rpn(cc);
 			return ret;
 		case UMP_CC_NRPN_LSB:
 			ret = fill_rpn(cc, midi2, true);
 			cc->rpn_set = 0;
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_lsb = buf[2];
+			if (cc->cc_nrpn_msb == 0x7f && cc->cc_nrpn_lsb == 0x7f)
+				reset_rpn(cc);
 			return ret;
 		case UMP_CC_DATA:
 			cc->cc_data_msb_set = 1;
-- 
2.43.0

