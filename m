Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343779;
	b=4g/OryMCbEXzlcK/pEqRVWVrFyTz/O8iVAHRoemSBtsSVmr1VKTyUwtKyspG2t0TTjCw
	 hESg7lCjVaAaKHJV1dUT8CnN2xwZ7uXdbNkXdvr0i8ggWfUiTW7nBVfnb8By596bGPGF4
	 Y95MNCYYn60sEVfPmr1QhUlNSxpIW80EV2ve1bbiSybn+VSuVY1jpYtOlKzdvqfzKvkPb
	 D1anfv7wwwuxrJWlSvS63l/7ljaj8EIVVXpyXmezUxplzvEdEmkk7nXEYTc02DTzKnIJB
	 /dxLYkerUF9G2ZOdPxg+Zi93olRWV2YgxctaxXzdcLc1OLofiLytCnr6CmVMZmucvrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
	b=Tjwn6S8XTz8s8NBLtCITdPPaKY8J4KJt7WroIAXcS28zm7afX/jooUYtU1c9Q1ZrEO1q
	 AWD3ZUhIqDB+AaH9WUkaRgD0BFwZnvMZOiZVndsDWx6XmjEt6cm/yHyCRZhyn1QympLOh
	 8KhP/bhTZpW1ASb+KiHCl/AnvHsX1O/QvpMUmf46JadjA6GTd9Dmp2StQ30FoEsMwl67X
	 O3EZd8Mh+cXW6tCwVT1E5UBgKJ8XhvJ48DcdsgFHHBUbI7cTW2niP1vfQ9iK8MPYLaoXi
	 xea4k0eVHOY4m6SNs2SWtaH+I0EdwHOBr00uio/gtg1HP31dh3bFsPGaUCVNK1JZ5AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NHbP/zuj";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D38F606A32A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D38F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NHbP/zuj
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3863db981d4so2943515eec.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 02:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343778; x=1795948578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
        b=NHbP/zujJOpVBIV0m8IFi6zdapbIMuZEKUzKc1Mcw/QTHVdtTDlj+CNCR/eMMP7PDK
         dTSb3zc450m9kpRmzdWCMUY/VKxgf12GZJiZ38U8P2EqmfaswaB3NL7Cp+p6jv3CouTc
         29+0y7Qa7/qoPRzQYX1GTfiIu5zbfVrLldBe1OvM0RJCzK+fteJf6EAeWz0+6n38Vo9L
         79wVgpInJM1iT5lj1iZ6xLHOyRxLShUoGF39CedT2uDUqL5d8f2yIPEndFOk6PvFQZrV
         G5Ry87DCGUU5/7aYTrWHo7oAS9dPmPL8e86GrKgNZuwp3hRVrWqEpmTAS/hZXGM8U1B7
         7Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343778; x=1795948578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
        b=mnUf125UKcdDojiF+QmzK+Z3FHwT3F0qIcPUbGu+PL/WytX3Ir1BRsP2VZE1AuJikN
         TTJFlmQhZPcQhYsT40JNIRZtkVVQa8Dj1B0MLrS6X9jOO/+VCOkAFcfaxZ+HuwU1JlQ5
         3kdP7Jrg+FBVbmQnWCFc1dSF1sB07n4AlSHDNvBC8wlF16wfSUtOtqVOPRV5cF/L/Atr
         eeYeCYfYhDvLQntbmsXVeVQB3aMmrR8crhTHTp1YIoRBfJGQ7dCIHnmRpye5NeDftqOG
         zDEIwaNAeje+9/E29fHhESg4x2FVHiFhGOo+eBai1x6Vj2Ko5aRT8hHCpAPocn0glstg
         Evuw==
X-Forwarded-Encrypted: i=1; AL+hErEdE/tgBSAymSbthRiwzKVONVLLQ5fDej+WMBKHQgXQxJ7n5+faqkE06dtcvRJVwW/fdK+C2mOUaKPhzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wO2fksoZOsrXWpf5QTMUXkoZzpj5UpJkShTb50L4HjQrRWl4g
	+ufNxzI0GeLwZqdSnWjAGXi5VJ9NpjNT8oO+rZhFUR3eRd5XWyo7nCmn
X-Gm-Gg: AZFdTZfOx6z/Jrs8gqKzLhbU2MUpOoEoWLnkqQ+gum5MLh5LIqYr1wlmW8msGhfubd8
	04XfYCjmSjAWzCLV3G711Tbt5pr+zHobACxmYCdNFdanPwRRmDqbdI3kQOOP8DhMX705MFUX6x/
	uEJ7hi58Bw97pmtKmeCulRoLY10RVSnn1imLVmVgzOq2qVTK1a8FFJ2lqFXBRcDh/XGcrEd6gfn
	m8SWl9mLQYPAuhZa5OHSFK8AAkY5DD+GY7lx3AarHcprgMFi768ifTUjE6vR3tnk+PUz8kfn/80
	D9KaFNWcp9TLYHg1aRuz3LtuHVMYBaRSYsAC8TrQw8nhk1eT5/hAFuLyLLmAjBjGwRl5q1g0G3p
	0YS9o8BEfepndLtPyS41W9pIQ8cPIWzjkeW1TuxC4jetcN2l/JF8lah7NrqwX4pA9Gzh9hYE5Vm
	ChqOseAtnhDmDO231fu7d7ixOKMrvw5GQ6c21zgXwjZM/IF/7VWMnNOvB/m0hozkKUXEkCg++Kw
	Fg6wpwW0WxQoDO7EiOLZ4GYiUeMnwh4u8riwQz+PfNF7iCeURsxLq8vOBBEUomiL1gmxlOVT0XL
	WazWQEVBOFcE/bJyJmHUTtwi9MScc7FLkj9RaRos8KIGT/tsBHF8pnGm7l9JM8xnI5zh0LRHiPw
	4A7wFw+4mR00EcFnz82gc+YNJHDY+WZ+z9NwVKJnT9d0=
X-Received: by 2002:a05:7301:2222:b0:384:2662:a7fe with SMTP id 5a478bee46e88-3856c9a1180mr7697616eec.1.1795343777651;
        Sun, 22 Nov 2026 02:36:17 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm26176803eec.9.2026.11.22.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:36:17 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] ALSA: seq: ump: Convert MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
Date: Sun, 22 Nov 2026 19:36:09 +0900
Message-ID: <20261122103611.3264343-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

A UMP MIDI 1.0 client gets nothing when a UMP MIDI 2.0 client sends an
RPN or NRPN. Patch 1 converts them to CCs the way the core converter
does, and patch 2 adds a test.

A related question. In the other direction, CC 101, 100, 6 and 38 from
a UMP MIDI 1.0 client reach a MIDI 2.0 client as four MIDI 2.0 CC
messages. The same CCs from a legacy client are combined into one RPN
message by cc_ev_to_ump_midi2(). Should cvt_ump_midi1_to_midi2() do
that too? I can send it if you want it.

Tested in QEMU (x86_64) on sound/for-next 1afd6b7547b2. seq-ump-test
passes 28 of 29 without patch 1, where the new test gets no packets,
and 29 of 29 with it.

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  ALSA: seq: ump: Don't drop MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
  selftests/alsa: Test the sequencer UMP MIDI 2.0 RPN conversion

 sound/core/seq/seq_ump_convert.c            | 36 +++++++++++++++++++++
 tools/testing/selftests/alsa/seq-ump-test.c | 20 ++++++++++++
 2 files changed, 56 insertions(+)

-- 
2.43.0

