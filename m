Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608772;
	b=ayscM4QJm4DgmJHA/v2B363cGyQK+uUBxtgNjyMv7UiO4RGlQYXQAq3ziLbwQIuQSF0B
	 zfIapSsiAJN31eYjlWznYiw8R4z8SZVRcZc72mdIxJAREcbNHkNS5cpD2iwJ6SbXhPi58
	 hmgh1N+W6Kq2SZ3SBMuleYDTRiZnVzpy4wEd/mi9etWn0imdeugCswwpZI9Y0+uYeNkdB
	 S7/E0Xkmzq1hxKbxeb4yYQea9qvYFAWraiQenSaWK4d38Vi3zp1Etder8ydlcBdTJcdVa
	 qGVEOeIexIxkSJ2+3OgO3IkLQP3/q2+VwnaUxuY3G653qYjpkCi8+n1h/Hzh0EGU/Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rYPqNNQTB0KS1iZP1Yah3x05x6is9oHmiMLVkcdjRCw=;
	b=lNnHlbLIK/JGuXvH+z1Qfdy7/dGLX9RofHvoxiXd6znSIqv0WKREGL/DNWQ6yJys7bzG
	 0BtChLgZDR25cnlg82ahnNth/db2kSYY/5Z2I4dOJRmue4Y2SLNpBoarLYfr8y4dy4hRj
	 xx/bhzWBYEqKzG3MWKCQzeianQuQOlGDHgrHeKOsYM0A6B8U83fBsOncyLHJ7Vw5xdWYE
	 pt46mHr7jRKKcmxmGbtPWcj5TtjMZjnGMJltmH2FXltNaL2KaBHgyzcIOUCAuAeFF1JsK
	 ejaM90f2ZwZXfPYKgKGFLvcfHxhOFH3qPZjQLmoqWb1Ny02ABjO55Mgc/OOYC5cgWyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="emTxQ+5/";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A0606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 12:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emTxQ+5/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38644aedba1so8646276eec.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 04:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608772; x=1796213572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYPqNNQTB0KS1iZP1Yah3x05x6is9oHmiMLVkcdjRCw=;
        b=emTxQ+5/WwdMet3hczmEvvqlS8s/6vNiHs/wlvNhM6fF6pOBHmriEXXhMCR+KYoLWZ
         9A+q+jaWvAdPjXdH17hfAV+zUL5jjLHE+ggvjs2a7cFhqjm99XzRoT0zncIQiKlRasJI
         Hk7h61oOd9yXI9QDOav/WWh7nXxBTtHoSczRx7BS+otctELjiSmFc5xv0t/DbSLrru7s
         mpsNduMCW929aLUw0YnthTSoHylbs+G1CYT+DpiyV+qIz/WB4yhyEaXnnHZEAAqGAyiX
         BsmY8DQ7G6dZUIwxDWLOymIh7IhgX/9ylxltMHiYR9qfegB9rjCKyHuzM49TevFRKFB2
         raNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608772; x=1796213572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYPqNNQTB0KS1iZP1Yah3x05x6is9oHmiMLVkcdjRCw=;
        b=G0WNIthZBCcD+hkgpZvC09aiZ44nwJDaQJwM4hSzRJRoAAIEfKixRihGG0LtDiwI6x
         VRGeMB+5IyIMmVlMcIry/mcmN6z4JJ4Z52rCgw1yp81UlQZ+r1D35zn4CI96L81n4gxv
         D6XB9ksHE4qM8lsC+ofMpKQQA827m63uH0xe+l7quAa6iIrv1AJdpdMcCOn0qu4QBOL1
         hSYrNq0DPcqhkeZibrxS0Fpq9NXRG1LrwPe6uw0toELLviEkZs8JGjW4hN+w7Fvw7XAO
         qzprZxSWiV6/TfZ6pgHz5Du8X1Yi/gU1WKYnKB+WbyJrVyibMHCIku90O5bDxV0Hu6dE
         OaIA==
X-Forwarded-Encrypted: i=1; AL+hErEm9vMNjjcCs918xNghgT38Nufi8v/kMa7aoz2dfoO4JJbgmlNBok2ZUb9uRjWgkJ95yQT73M8cL5/N7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y/LCt7ucERuUSmRRFX7G7CKUgDmviQKgdLyvGqt6S2bSsOL7h
	l7XypUakFhsy35bQkVHHvYMma9fXiYuSHzR0GSKQ1fSFLtRnnTSUqNpP
X-Gm-Gg: AZFdTZdSsyLV+xCHoBYPUm926MbGIaTSIwlvFDycIWglApvMgDl6wdcEuLj9hKrledD
	lvI105vdqBLYrxtAgStEKHyk5I2FIsO6YMlDaeCq4XU7AAU+GUYSxtxKM5xADQAmXb5Tj9Lwz5T
	KHfiz3BngeNSO7h3loa0n2yebYq1e2HRBY07rNfiLjXZO4Y4/bcv7EhhFQcnFOcguTeU1LQNnfk
	SfYd7x1SRsrE7W5wBISqyZBht3yCodtpiE0WmdZNMWTT4PCAC+SC5jE4Zv3XXZWqcaRW+vFad9C
	Iz6AYZ7TzmLyLRgAlwYqkWi6s95X8DzPQHxm441Lza1ZsOYvQi7kAGy4UC3CJXH8+uhV4CKfq9M
	uGyeQyv6wWtU99MJtkmXy7IW6wxq4+/981BaZO1bOKeS7nwBhYnopgJazuOOfb0itZ/TDDVoDIh
	GWVDpUFuNsf6LFSI1f3/4mj6oxtZ2gxYbOSoei4Mmf/VhL/+E52cqpZGj7FvgOPjHM3Z8VPOCHh
	TtbcGQJ9F1M9jqGFILOo6QMP1/oEQfn+zD6TS2Y5uL9dP88t/XMuVpz1gUjgCtaB7pJR6bcMlET
	+HV0CwCldS4Pl05x6EvrDnUcHRy9PNMcvuS2Q/lUCuEzNi/GLk3YBg==
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr19175296eec.19.1795608771243;
        Wed, 25 Nov 2026 04:12:51 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm12234336eec.17.2026.11.25.04.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:12:50 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] ALSA: oxfw: bound the stream format entries to the response length
Date: Wed, 25 Nov 2026 20:12:38 +0800
Message-Id: <20261125121238.1602172-4-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
References: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
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

snd_oxfw_stream_parse_format() takes the number of two-byte entries of
a stream format from format[4] and never sees the length of the
response. A count of 254 or 255 can read past the 512-byte response
buffer. An accepted format is stored with the length of its response
and parsed again later. A count that needs more than that length reads
past the copy.

Check the length of a response against its entry count before the
format is parsed or stored. Formats other than AM824 compound still
reach the parser and get -ENXIO.

Found with a CodeQL-based static analysis tool. Reproduced in a
userspace harness under AddressSanitizer. Not tested on hardware.

Fixes: 5cd1d3f47a63 ("ALSA: oxfw: Change the way to make PCM rules/constraints")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 sound/firewire/oxfw/oxfw-stream.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 5e36d7153a7b..d8fe136369d8 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -484,6 +484,19 @@ void snd_oxfw_stream_update_duplex(struct snd_oxfw *oxfw)
 	}
 }
 
+/*
+ * A format of AM824 compound has five bytes, followed by two bytes for each of its entries.
+ * A response can be shorter than that. The parser rejects every other format before it reads
+ * an entry.
+ */
+static bool format_has_all_entries(const u8 *format, unsigned int len)
+{
+	if (len < 2 || format[0] != 0x90 || format[1] != 0x40)
+		return true;
+
+	return len >= 5 && len >= 5 + format[4] * 2;
+}
+
 int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
 				enum avc_general_plug_dir dir,
 				struct snd_oxfw_stream_formation *formation)
@@ -501,7 +514,7 @@ int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
 
 		err = avc_stream_get_format_single(oxfw->unit, dir, 0, format, &len);
 		if (err >= 0) {
-			if (len < 3)
+			if (len < 3 || !format_has_all_entries(format, len))
 				err = -EIO;
 			else
 				err = snd_oxfw_stream_parse_format(format, formation);
@@ -662,6 +675,11 @@ assume_stream_formats(struct snd_oxfw *oxfw, enum avc_general_plug_dir dir,
 		*len = 7;
 	}
 
+	if (!format_has_all_entries(buf, *len)) {
+		err = -EIO;
+		goto end;
+	}
+
 	/* parse and set stream format */
 	eid = 0;
 	err = snd_oxfw_stream_parse_format(buf, &formation);
@@ -740,7 +758,7 @@ static int fill_stream_formats(struct snd_oxfw *oxfw,
 	/* LIST subfunction is implemented */
 	while (eid < SND_OXFW_STREAM_FORMAT_ENTRIES) {
 		/* The format is too short. */
-		if (len < 3) {
+		if (len < 3 || !format_has_all_entries(buf, len)) {
 			err = -EIO;
 			break;
 		}
-- 
2.34.1

