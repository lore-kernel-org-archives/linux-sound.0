Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387886;
	b=XS8jfYRRwJjaJV1UL7gbraX/YosnnO4P7YKZNxoBedXD3V9+K8hVrMFlVD7Pz+EudG9j
	 Pxrwv71DYqx66o8KqtvT4zVwt5xZwFplbvKZyFVkYQZ9lNIY5AzM8rjwju+j0UPKtkp/H
	 LXE++qhz9fUCDCP6KrGz6520g4LkN0UbNc//Pr80/MtTq/FkUmJU97JKf2oFMgzU8PKWI
	 Lu4WsBtResD7G4Ltxowct+/pJmeLq0AqaUg+HNDdJp2R3FnNtW+Q5N2dIbJ9Rnvhxe/JY
	 qDsEjYdI8RfsIfzJuGZNzyq1I3IMzZX/zqds6EKIsx3ahMkk89LO8KXEummTfx02TQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iopuf+0CPJ1prxbi5e5LK6HB0bPSt5qJvXq2KBBjS3Q=;
	b=d1hthSl9jXr4D2PbjOjKJOm2zJYWw7Ja62ycfHxpCM8JxOezFdKlLJLRIEt5KXFi/DPC
	 vF3YYjsaxeEVem/NGzeCtFGPJo5Oyg1vPEPD13sRirqjyyDWwioaThu+GwurWDpxMh4tj
	 lB6bySAYTSG6BwiphJUdXRq++3ATDhSoFMvDmDvlx56HJ4JT2M6DXJtmiKtl8iSWrLZPX
	 3qVqQk3egKn48VARvuE7W+uuM3wPuRRfT883Ul1mEM3kBlfW4zVK0IDAUBepcMrFM2zCF
	 gVNdNItjaMvQlwHxeo3zWKvQNSu4BJs+bLEsDwX8jvq2xBqLNs31bs6sehXgglPbWqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D11pQqVL;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7D2606A32A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 09:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7D2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D11pQqVL
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso1388005b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794387885; x=1794992685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iopuf+0CPJ1prxbi5e5LK6HB0bPSt5qJvXq2KBBjS3Q=;
        b=D11pQqVLxduA2HiDS9kaLe4YqBelzGoE/SDyLf6kxKBLQDF9C2rBRssaQoZoSzQt7X
         KLLjr8DL359uabODoinxTgWguCexJ8rmXUHxIAlmRcv6YnJm32LjC3rwevowjnr1supR
         bILDTTctpU8VgbELeRcea/4+RJGNAx80V8hXvnJ8lPUCDOklhiA49lbWP4O7LTLE8yvr
         i4FBS3NxqYl26HukRI7uOQKstJeqi0XHr3Qdv5JT1MwWNVeac5oVz2EDjS6QmA+kVXu/
         llk0PDa6L5Q0MrL0KalB++Uef1C5uOcuo1As9tGv5ROY9NLTjFCjajeANUuJCFO9oWiQ
         Q2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387885; x=1794992685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iopuf+0CPJ1prxbi5e5LK6HB0bPSt5qJvXq2KBBjS3Q=;
        b=U7Fwmp2oCSiUX1Tk5ju3jANb6mHGCxYPTyhFuk0LmoKmP1Z2zH2C8i8A4SLSf9PkS9
         veQ2V4BMVvcV2FML7fF37VNPU0OuqyXXwJ0A8z9NsWtmiDJhG37wD115WfUp52ctpnp2
         0fM4fOimqq4vekeJep2NYIjIA10A8enMzsdOxASjmcwoDOShbkG7rUpwJcBHkDjoZFaM
         YJ3hy62+ENd0/4wGc0l4Yb1H0q6GzLnLnM38CFPtvRjwMI3iqUVxiukgyJxhV0wFpr9m
         VAKnd6XtxVBvCGcZ4jedK1gYIWUDvRg8aofPBD0IpcDNdK0MW6ufJiC4dQ5PDnUTEW6q
         QnzA==
X-Forwarded-Encrypted: i=1; AL+hErEXHUVQDDfvp/09cdCfEfl2ChPFf039XVT3KAFQMIC0sU1TXKtfTi6EBUmRKNnVIElJ0XBPjhE/xFDOSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9y/MVmCjiMfN6FJ+JkE4NqHvCyKpWVEDlZ0JO/7JgJCS4D71pF
	hargK585V+fw7nfqmxKxzJcV+RUOua64dYsNv25uoD9SGQU8XunzX4z7vriTvmkx
X-Gm-Gg: AYBFou1BNNrLi4szaNcScPwjnuHOIA0iPWJUUXvy256nSJP+Edo0FMaszpIZ/11AdcS
	xJvBVk8Go73cLFc98uMYJfxeDAxyYpiKbRcncU5cBB+1H4dBLZeVBs3mkZsHoJyTegWuLg1Di3Z
	tzTsXstl7BQp7+G4cOn49KZU3yC9EL+gmlpgyCbTEVnzSQQhgxB6E/rcSFzn387V9ZpsbFoM2Yk
	KwjNfiNv0YvqJscikdPA3DP4Bl41rLMgz6FqZ5qZ/Pxc04nhXVP3fS+bdpgeBxzB0LT2IZZo35c
	D84WR7eYGOCYxIT+wprOrK7d4NWP0ZW6+yGomgR3aH/r/HTJ83VsGah3S3kwaTIxq643yZ+udzK
	lf9LyzLOwTHDsOw6YblyGB0/Y8WjcKWCUvVlM3Eswf+G56XSMJYVuNtQ5dv/L4UsGgAQmog4EYp
	onHPqy/kaGP15IY/7kkldnKSEWbRi0ak3bszAhWZNIdcgJrKZ5hv+VAAV2GlME/lIW+5QD8DypR
	Mowks89sKfHy2gQXhARowgm1NMffjELSsN29WMx8tE1tVjei+37zGRI4VAplIPkg5A1zhBVfVtU
	najX9iZGum3zxuo7lfmdKIeUUZkyiHXNbntcNigRr5bR2b1NcvnwYuwp22BZezCwt0IPztoOZ8h
	PYwPKzXbxjMhNKhKG8S/pxCTQIFDJFK1YOEyb0/Ct
X-Received: by 2002:a05:6a21:610c:b0:3de:3f4d:f2bd with SMTP id adf61e73a8af0-3f2fa39112bmr1401992637.6.1794387885274;
        Wed, 11 Nov 2026 01:04:45 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7cede06sm1929924b3a.7.2026.11.11.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:44 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	ivan.orlov0322@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 1/2] ALSA: doc: pcmtest: Update to match the driver
Date: Wed, 11 Nov 2026 18:04:28 +0900
Message-ID: <683abc21677cc2fea5e00d1b620b9722dc98fad0.1794386073.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794386073.git.sammiee5311@gmail.com>
References: <cover.1794386073.git.sammiee5311@gmail.com>
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

The documentation does not match the driver in a few places.

The inject_open_err parameter is missing from the parameter list and
from the list of callbacks that can return an error. The fill_mode
parameter is a short, not a bool. The selftest is
alsa/test-pcmtest-driver.c, not alsa/pcmtest-test.sh. Pause support is
not listed.

Fix these.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 Documentation/sound/cards/pcmtest.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/cards/pcmtest.rst b/Documentation/sound/cards/pcmtest.rst
index e163522f3205..ed0b57f583b7 100644
--- a/Documentation/sound/cards/pcmtest.rst
+++ b/Documentation/sound/cards/pcmtest.rst
@@ -16,22 +16,24 @@ At this moment the driver can do the following things:
 	* Generate random or pattern-based capturing data
 	* Inject delays into the playback and capturing processes
 	* Inject errors during the PCM callbacks
+	* Pause the streams
 
 It supports up to 8 substreams and 4 channels. Also it supports both interleaved and
 non-interleaved access modes.
 
 Also, this driver can check the playback stream for containing the predefined pattern,
-which is used in the corresponding selftest (alsa/pcmtest-test.sh) to check the PCM middle
-layer data transferring functionality. Additionally, this driver redefines the default
-RESET ioctl, and the selftest covers this PCM API functionality as well.
+which is used in the corresponding selftest (alsa/test-pcmtest-driver.c) to check the PCM
+middle layer data transferring functionality. Additionally, this driver redefines the
+default RESET ioctl, and the selftest covers this PCM API functionality as well.
 
 Configuration
 -------------
 
 The driver has several parameters besides the common ALSA module parameters:
 
-	* fill_mode (bool) - Buffer fill mode (see below)
+	* fill_mode (short) - Buffer fill mode (see below)
 	* inject_delay (int)
+	* inject_open_err (bool)
 	* inject_hwpars_err (bool)
 	* inject_prepare_err (bool)
 	* inject_trigger_err (bool)
@@ -93,6 +95,7 @@ writing '1' to the 'inject_hwpars_err' module parameter:
 
 Errors can be injected into the following PCM callbacks:
 
+	* open (EBUSY)
 	* hw_params (EBUSY)
 	* prepare (EINVAL)
 	* trigger (EINVAL)
-- 
2.43.0

