Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143048;
	b=ZRJ1V3jSuu/Rm58uRpk5lYrCOncsJJVqnjrSWVi6n6zcNlzWl0/oGBS9/WmVShrpOuBO
	 F4YWuXv3fEA2AT2NhgV3JwKwj63EqLcurAWlNjtWLJJjGg6MZ+F3GaA+ScjMV7BHxqUSz
	 y1+rtvjQVLEML/QfXLOeDbgL1lgg+JfsfjTqc71dHusLR9u+T01D5rI3KIZXQAeveDkiT
	 Er8amrVhMO90ryXUxIYabd1rGMHoLyLcD6ZXJX3aPrfutmx3smZx0XtSKG0UKUbdaxHFH
	 sQmtoJVqsy6JoS9aASRQehtBymKg4us4CjnmFQJycvoTQ0JdNIKpDXjDw2izrLxbaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZapCdoqGqWMAQgXzjcWNscud2Aunl0QfBTjahqyvzOU=;
	b=WDIv8lUxpZI6StalTCeANzTgFwh9BpGchberK0wu5rawihmv59jT5hRdBMvcc7XWgw9X
	 5699qGos+sb7evBiNA05DBDj+NpI1pUAolQ91HWMT8x4JO5+fOfnMWYCNqGen+gQQTdSx
	 n9DPl16/o4wnAc4n8WyY7mNirx8bb5vSwVXEdookhZKXfPwTDvFZMWtdyzh7vdowRRDyJ
	 acTvGV17P97uwVcqkeJ2Hd3KK1S2MHrru7XqFvBJyfhC7th4Sts1HXaiNOPaRXM3wtKQP
	 DiwZx4jr9oBjH58fNJdX5Hr3Kx+obf9SG6jGHqfNVwjzplr7mbV05LjQwSTsYmAHtYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LoOB//3I";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2621606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 13:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2621606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LoOB//3I
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1931ff67a29so224799c88.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 05:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794143047; x=1794747847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZapCdoqGqWMAQgXzjcWNscud2Aunl0QfBTjahqyvzOU=;
        b=LoOB//3IGLSlepYjPgNYVN2vu2ngY+G0YepOIG+Bh5vgAs9ssOeNJaHpebeEpjltZ4
         4429wQwagcOC1i228bWCxL3YIsymBg2gKCO5rm4QcWjCspktALrb2rK/T/uNynewjkn4
         Ry+5WeHjkdFXZBmQg8Jh1CVfAgbk6db4/SGXij0XbmyvMTiDTLS69MqaKCszrtffMLKF
         rjG5rKH0aCbqXKOKYL8BJhEoRusIPNpNqVrOopMvnAq6rnX612M7eXXDwNJM9cATfUKn
         33QBz4TQbgahKchkXqHT7DHpVnrHhyowREt+uZWa9oSNKp80Ubr+8qu2tLIpfJydH5f9
         x4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143047; x=1794747847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZapCdoqGqWMAQgXzjcWNscud2Aunl0QfBTjahqyvzOU=;
        b=Jlk6EAFKmh5SKT2L6ulSujP5p4PDsXMh/1Bl2IWH9Kubyk9OYHG2xQ/SsgztblJf+e
         oKLsjtYdsjtI+lgmbVKktKq1QxKq7JiWXIOa/JCshfqyk29iM0r70E6/ldtBl5zsUe/9
         NhP6X95KQDq9r+t+Ms5uwpItKhKFapgLuMI4xB6S1uWuT+11UQ8vRMagaliE3GW5jaWo
         xYOgQ31sxoSE8LbxWhFqYERHDsMkzU3dv8FQjUNDw0oTPra9bDKFZm67aN/+bYTlLY53
         BOghDFwGFBsGwsNdt4zi1ak9aX2odfQ8W7DHpDmYtQZVmWrriftj4KHDOZxm8L+vHax1
         Ls9g==
X-Forwarded-Encrypted: i=1; AL+hErFoEnihGkVMh+ITXnejdLlMAsi4v3QFEyUC6mC3y1sm9rT6bO+Ugm3wngK6J2vRXDossMu2fYjl3TMxUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SivFOmGXqyKXXPvJFii+8hO0EWLGr2XpmUp9Z1EitVvXtasCu
	ZNjqFkSbC725rmYa2Az4z4BV0vepgEPdYOIAUtvOGo3Yjbr4Oln73fy86zvlUU3IMDk=
X-Gm-Gg: AYBFou0HkexdJLINV4j5v9Ya48n4wUJG1zL6O/5Epz3q1y2ZQDg/eTAGzSdhvTuiDhr
	pKwpLlQt8E1uw4t7d4p8WfrdVyVJ19ZawMmZ/ETJFpB4FmeuQwz+b3VVmbWMnBr8pmRdJelbUCr
	+vwtRLUMtN+suMNA2m5KylV4Euc+c+54wNEIbr93+d7IPoQvhSHBUAt6CpL4v+tqYUa4n/QAgV8
	wBgIJwH0dpLFUBiTW9QHEgGohFYZH2Z89JeUcnOBCuIMbn5tuCa1mgNMIvQqrBoTihyng/g5e/c
	xcpeFLm8Q4BaxPx+RhT7zjCG4ScNAwNjVcpYPijWOvVyKyInZNbsO9ZPcQOEDb90C2aoXUQyv03
	7utWOGaeGz/9geE9nQXFZfraCEq37JH8TKMp1xbbEBGsQ1q8zg2kns2zLt/AnUXFhSKwEhnVLAA
	rz88DXTWi4TnyPyDblCbG5p8fRx2rqxeB64Aha4lnz16pRUjiZpMJgTL0K22QCZqcQNgX25f914
	HEmwNmrDKM13nYTnjoFtS0PyV8hi2uI3ILKEfbv0nJ6wocwA13zsI64PvdDvbkYjPjlVowrPfNA
	fcTwTD3Wpqa1flZ+4DI4kM8Iz8LSrff/hNCpuFvaywttLwyjiZbN+6k=
X-Received: by 2002:a05:7022:2209:b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b39ff060a8mr3158032c88.40.1794143046735;
        Sun, 08 Nov 2026 05:04:06 -0800 (PST)
Received: from prts ([103.156.242.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm6603194c88.6.2026.11.08.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:04:06 -0800 (PST)
From: Xinyu Wei <xinyuwei1024@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Xinyu Wei <xinyuwei1024@gmail.com>
Subject: [PATCH 0/2] ALSA: usb-audio: second configuration of the Steinberg UR22C
Date: Sun,  8 Nov 2026 21:03:01 +0800
Message-ID: <20261108130303.387288-1-xinyuwei1024@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Steinberg UR22C exposes two USB configurations: configuration 1 is
class-compliant (2 playback / 4 capture channels), while configuration 2
is UAC2 behind bInterfaceClass 0xFF (6 playback / 8 capture channels and
two MIDI interfaces).  Selecting configuration 2 on a stock kernel leaves
interfaces 0-2 unbound and registers no PCM.

Patch 1 adds a composite quirk entry for configuration 2's vendor-class
interfaces.  Patch 2 fixes a bogus bmFormats (0xffffffff) in
configuration 2's capture descriptor so opening capture as FLOAT_LE does
not lock out playback via implicit feedback sync.

Xinyu Wei (2):
  ALSA: usb-audio: name the interfaces of the Steinberg UR22C
  ALSA: usb-audio: fix the format bits of the Steinberg UR22C

 sound/usb/format.c       |  5 +++++
 sound/usb/quirks-table.h | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.56.0

