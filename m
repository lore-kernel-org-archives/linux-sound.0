Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9B93FD15C
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461871; cv=pass; b=QfRBXzXeZPDmPBcOa2oyHMQhveVTwSZzT/TnMgt+SgF0Hqa4XmMCirKKDPVoHteiOmWBqv3JR0EjOOCjoBKSssY7a/k//vzEu+XvwxGVZ1vZyhtnVhYyFC6M9XMYmn4Oq7ju/ixUCw4ZdvXQc2y+ohG1U1d9hVw21vxGZ/JoL5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461871; c=relaxed/simple;
	bh=XxcKUwBhWNMN1nhGWaplw8DMP9BA105kP9x8Sr08qfM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=upJru4M6NO/N4wCSf5NLM1sW3hiOHKU7Xy5SUW5qpeGnE1PRDg5Ne8DdkqSOMTuE5QvZvpfJ0pbtghKkEnARgA1eLrAbgyeZeSCFw5+EUS8kNbi908qcjWf8pFDDafrMKJ9QukkvCt7STWRw8v16aPxBy5salcnPFR9LzwKwoFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmFP4zrx; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmFP4zrx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so3496182f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 06:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772461868; cv=none;
        d=google.com; s=arc-20240605;
        b=kIntQMszbVwHm3WXbqjwvePCtQoEWqU/P9u+N0oRRhzu5qRpPE+gnI9t6DfGVD40z6
         tofN02lQKei/1ab/O3rqInorf+p4NxzymA+NFPGruShorQ/dmmoSO8iD7gn/zyZfJkkt
         zmaUhRZ74xl9pDxpDwAI68gXbzjy7ti7iM2+HhjwGTYYGNu2LqULeUIBFS8b1L8O1fM6
         oZZBku0Nj6L+/mQzKA6Z2sk5/SKWcbHazyOiYGT1zjpVDgj4k4SFYBIXv/xSrJHRxuEQ
         RDja43nHzUkmTiZXk2xzzrNGuEwYyYLWRkl4HkjqaUyOmbQoNTcIB2zuulPUNycuOaBN
         +Nng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=XxcKUwBhWNMN1nhGWaplw8DMP9BA105kP9x8Sr08qfM=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=XovLoCAQUm7LNekhBMVJLTJbN5yHpaXKAc87ymGd4DCSqjwWFQ8cM1dJ+PubHWUTju
         LukcDqggRa3Y27T4ntUix/KcEtN9MqpEuoMkECMxZ6PmvuSMZhJqqX2kS/GyzMU2f4LK
         WGd4Y2PFazgasJSvGDsO7xHQgUhjDPh7plQAxjFcuzweYHISarL8XB0finQFlD7AbSra
         L56w4UVjaDijCwJRr5LZfl2GHlzGY+obkTo+XnLfqgvIyiZWS2S82j1pr8c2Mt8/x0jg
         OFxMXlELMuZH2mO9Gye/EAPWD0jMTLZX94RQQ9N0oTh3M1LsTCFT6H4g1M5VEQMviOpQ
         bdXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772461868; x=1773066668; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XxcKUwBhWNMN1nhGWaplw8DMP9BA105kP9x8Sr08qfM=;
        b=CmFP4zrxqk/xurN0pw3Zf7kX7D19J3iZZInBOu3efrMHmE6qS6mOL0ZBBZ+DYt9Ifu
         oRiSx2V0av/JUyv2uLt9VDy5UQPsAY+29RjkKz6yzYbGiIVC3+w7HUCHj4tg/9gooIOR
         FH7buu/VlXenqKA6k4zmRlR4F/zWDU21RD1Hvbzw5DJSBpRNhkyvsiR8XGbw1fegVwhG
         ROFZ8RXMc1/RELRXGdF35EMwT9iMfpUQo2X7a7lPBdOab+1NbCL4zM1I/nvr+fFF7lBZ
         7Pv/B5SLD8JKn9NleP+V6Ri5ZYzPLfhSA8xmDr2DK1GVjRS8mCo6jZB2fROmCe+ZLls/
         As2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461868; x=1773066668;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxcKUwBhWNMN1nhGWaplw8DMP9BA105kP9x8Sr08qfM=;
        b=tgOjoCspyCPBm4DLQ61NQyuqnRnlHlKCEsGJwGnKIWKh+XDbFX8mmvgX+FkSEca03b
         DYtJNBoVnUWvZIT2BvXc84U7oxu6NkDTvBwOf9+k7xaSaC11MSlujdhvpv0nKSx2/ACF
         L+vD4VK5v5Nf2F0tjvJwrgFVq4kM7Ba+oaUvsR8hO2yoboVthIwCguo96cQbFLq+A5nB
         X8f9aX7UsH5benECj04mREV9m3EUqHLNX6PwGJdjqmPdMEyzDI85VwYf3cm0BwavBW0Q
         xZmw/gbOISY3+tB1/8qbBVs1Tj2lzIGDfOPJClZZRoZo04NFfsZiKSeyuAMPj/j6/QXO
         zMXA==
X-Gm-Message-State: AOJu0Yzk0m0LTQDL0BMsQZBwq2HBysYPShxUic+37MJJZ1AdKUsXomWi
	wtll+XM3LovMkp4E6Stzvs0I6Tk9+OTtNzEmgs86vMEoLZO3Dn+q/uF4/RK8zpnAVgLof3xDsXg
	wIqLZpWQmDV5l9XM8yVvQhVjrR1revOPBkSDOAXHjLA==
X-Gm-Gg: ATEYQzzZNCBmSsQ6aDW+uVN0PsBIqaU+iJnpaFmbnbza5un757yASBSxL6Zo/l0TTub
	QnpiEIYpyRv2HrD3/YTLVgbqTkr/9IkbghyKp4+f4ajVSNrTq3ZA+epAvCys4bLxTBdxeV3Agl5
	sBMEQyjeK5AxMpEKiZjl1FIrbUdm9PjQSLVHmfqP4fTJpZkbabcIbRQGeMihoEvzCbusC9an50y
	82sl+RlfRYCZgUz/Ym9z/IRiEWIFqSHY5wkI79dlqMheLAkZ1v5oYdpxeek0zekhuDL5PojHNmT
	7Gc3s+x9QovCq2xOu8/EI2sgCRWoEVrQKqdWxSmF
X-Received: by 2002:a05:6000:2506:b0:439:b339:7eed with SMTP id
 ffacd0b85a97d-439b339874fmr9983018f8f.20.1772461868012; Mon, 02 Mar 2026
 06:31:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Mon, 2 Mar 2026 11:30:31 -0300
X-Gm-Features: AaiRm52KkeVe-QNrmnIPto7S7l1AoZ9y1LpaHBJeDD25Lxrl80ahyLZMYZlsGgQ
Message-ID: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
Subject: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there.

This is my first post here.
I have compiled both RC1 and RC2 for kernel 7 and after booting with
it, no HDMI sound at all.
This my laptop:

Operating System: Kubuntu 26.04
KDE Plasma Version: 6.6.1
KDE Frameworks Version: 6.23.0
Qt Version: 6.10.2
Kernel Version: 6.19.5 (64-bit)
Graphics Platform: X11
Processors: 12 =C3=97 AMD Ryzen 5 5625U with Radeon Graphics
Memory: 64 GiB of RAM (47.0 GiB usable)
Graphics Processor: AMD Radeon Graphics
Manufacturer: Positivo Bahia - VAIO
Product Name: VJFE69F11X-B0411H

With kernel 6.19, even the RC's works perfectly fine.
This is how I compiled the kernel:

git clone from Linus github
cd linux
make mrproper
cp /boot/config-$(uname -r) .config
fakeroot make -j$(nproc) deb-pkg


Hope this can be fixed soon.

Best Regards.

---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram
