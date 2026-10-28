Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212412;
	b=mPUdnmLgmJwgkrbnVQDLb88mn58cRzdTDFlbih7BbtYCwG6csZujPGKuEq9yxRUATJiB
	 O7SGg2sOqdu/zGdGD7yfd/hkKfMN9dM/O2Tfnx4CkQgfzYU8nnQM39JR5bBnWUQS3aMOd
	 ra8dhVrDSp3jim4koaUjIgFo7tbq1E8wEHSPwjfW4WGecJm9+tUIUZOwF+FDdt+/9mjOP
	 +z1RKgMb61/WF7jmIngy01SLqhKm+QrsZALI0rxngzzkiF9fceXinOH6c6ZWHYVENbyLE
	 P3bpQF+2AXS5VLGvdFYztCUyUORuoMXP23k2WOWF37KS9dWskpyDxlb9+arzOUtqfTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PkNOoHsVmr5rmkX8hMk8d4+1ZyQ8Wa7zC/MOiR79B1M=;
	b=Ildn6TKEHCmufy1Vqbg08OAdYLNmniB2TAVClrfeYqsy3AIeNshgN5JIdGgsM4x1bo7k
	 6U91vw2APaRMxXAbFMW1DVZM5/87gDoFIQP9xxHJFwtIPlATBkmajZj3qrxS9pCsQz9/X
	 7wbnSEPonEFRu7l6EtxCCdkEf+p2OemKW/aYg/YNFH341Z0lxNVoCHIatpjg5PwLM+yPb
	 ogifqaYH+NXUjri650Y4dGQaQd6F5A3+Y8JSJRkZ3jouq3AkpA6RTpmgSvX7O9Sh8Fsqf
	 G/wBUAdRkNzZNiR8XY0AHoYAMLGmNs+zRBYR5iN2+MxM/hjuHgk2spI6Epk6JP59azA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5U5BraY;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A7C606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 18:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A7C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5U5BraY
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afbd2c386so828709f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 11:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212410; x=1793817210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkNOoHsVmr5rmkX8hMk8d4+1ZyQ8Wa7zC/MOiR79B1M=;
        b=b5U5BraYnllroAUU40DZT7fh/RgWujIzZBzbF94YLGqtgH+dnwrjHMGhgRril9m8QI
         NROrUApUXI2WHIXM2ZDC8LekmECCtH+2Jp/IYFKAHIrM/Qz0Q4lrFOGRtaY8VGeSQDtv
         zpBOTxZWwgE3dkQUXMeC8Q9V//T7TsWYrdu5b/p5emqJtbrp3t1LqtIxerbDHWZUQfej
         Qhg5c40q7N/CJ7lp0dlMTgiXsM9UkG0n2tPuVpq3J9gCHk5FEFa1NeleQGyaxoOsd5R8
         DyYHt7NQqzd5rqOUcCXdfkyvRyuYBo17s1qVME6pq2MQnY7w45TPnTOJEbJbeDuKo/Cy
         EvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212410; x=1793817210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkNOoHsVmr5rmkX8hMk8d4+1ZyQ8Wa7zC/MOiR79B1M=;
        b=SIUJ8lWElbNMuZ07C2nQDoQYhmAsngthFaoXotqso0lckok87R0PEWIxZAcbdaUvuX
         bTzNeFbO3G8Wdyez1U7EJbqxw9BITN1ANR/ilblqXfksxnRp99W4TYr3JTWyqsOo5dIg
         IWIr62j0Fixp9XwnwjrqL5pQ6k5UTFAMTlz3J1e6KdGnoVIQbg0M9n7eUH+I4BxDvyAk
         IIaj+oBu8c8IEQYyjE3tYQk7wZ/bS21XCz8SdPB1CjIJLXNOYLP7JEvuBnz2mnsTaE/J
         NAdHEVwXEfTLQPktmjLELKGwwR4o7MbkOnj0hinK5Ys+EbwEsRvv276fuqhDzYgNmxJ1
         wMBQ==
X-Gm-Message-State: AFq9FYIRU/oQvN4SEbHbyq3YgfI8LGfSmRsS+v+NigSymXg0r6cwhjo+
	dpz2NresurKtPccd2I3LWIXb4kOby05EM6eDGEd2Rhc7zUwgZKy0qfHuxOI+SeRu
X-Gm-Gg: AYBFou16y09yW50qKS+yp4xP/v8uI7/vWeLmJmCcMquCP/JVPlpaqgLvKLEHGfG6lzf
	pFoVmvfx3nBCKdJXVGxJSVN8ElvoAf3+qPDN+qXAXnbDotnMCleYptBTJWVIUatKm7Hni6+jy0d
	joZor+1n/nWI3Nc3Fqw7n1TeJ+YCcjD111BHz9JjFyf12xqRP2uMmcZYenFiXvDtwck/xoUpEx7
	QAY0Uwh5HJy/RFhvZixqDxizb9lFIPWGNrBaQNMD3OML0ugxFHOBfbRkCV/KORpRyRR9ZPRhScp
	xFWXK1NUDGpnnfIDx6A9XkqAUNvzWXyh3NcQRjVjRapw54mlAqk0z110Rsn7CTQBuOmX1ox2b3Y
	NI/ClYe1Yr4LYLV6pdzT8Gie+6om+ZrobZ+MhQpke7zB4h+u16QhvRKLWpIW9z02aI0Gxjqlfdh
	tylDdr2pd3WBwaDDXCi7aCVLVrX1aNsfbXNnj6TMF+FAfbz0nL/6wQR9pifq08RyQcddfWKrVbp
	yasdC9NTLLzP8qVsVZj/q1HTDu9POCSjCruHVJrHW4oeqWMnEPhdl0jfg/MMJ0rEuGa+F8XoNwH
	MebaOmNNw95fyzgIB06M8RA87JyZ+7bjzs4zs4Ow8kWCQSuNoZ8D1X5ZVLUAi77qgjTCa8i+n3E
	bJcL7Ekk=
X-Received: by 2002:a05:600c:524c:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a9661ab67fmr75144785e9.8.1793212410246;
        Wed, 28 Oct 2026 11:33:30 -0700 (PDT)
Received: from gmail.com (dynamic-adsl-84-221-247-128.clienti.tiscali.it. [84.221.247.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm11723035e9.9.2026.10.28.11.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:33:29 -0700 (PDT)
From: Davide Gironi <davide.gironi@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v2 0/2] ALSA: ice1712: support the TerraTec PHASE 88
Date: Wed, 28 Oct 2026 19:24:08 +0100
Message-ID: <20261028183155.787599-1-davide.gironi@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87y0bk6gfn.wl-tiwai@suse.de>
References: <87y0bk6gfn.wl-tiwai@suse.de>
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

The TerraTec PHASE 88 uses different front-module hardware from the
EWS88MT even though the ICE1712 driver identifies it as an EWS88MT variant.
The PHASE 88's write-only expander does not respond at the EWS88MT
addresses, and its EEPROM advertises a consumer AC'97 codec and one MIDI
UART that are not representative of the board.

Changes since v1, following Takashi Iwai's review:

  - Add an early, card-specific EEPROM initialization callback and move the
    existing DMX6Fire fixup out of generic chip initialization.
  - Move the PHASE 88 AC'97 and second-MIDI UART EEPROM fixups into the EWS
    driver callback, which runs before generic hardware setup.
  - Drop the consumer-capture NULL guard: the early EEPROM fixup prevents the
    nonexistent consumer PCM from being created in the first place.
  - Use snd_ctl_boolean_mono_info for the Line/Mic boolean control and fix
    the PHASE 88 initialization indentation.
  - Give TS88 its own model string, and update the PHASE 88 expander shadow
    only after a successful write so an I2C error cannot corrupt it.
  - Updated comments style to fit better the other on the module.

The series has two patches: the callback/refactoring patch first, then the
PHASE 88-specific changes.

Testing on the machine with two PHASE 88 racks.

The patch series applies
to the Linux 6.18.58 source. It was built and hardware-tested against the
running Debian 6.12.113 kernel.

Thanks,
Davide Gironi

