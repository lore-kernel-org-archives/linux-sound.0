Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794515;
	b=wAF20Jw9CKfqHWTdo6AaCLAzjbqoHiZ7ud1NiXazzigBUcBjLV1prok3CHKawWrM7ua0
	 CX60fthBdB0fQc8kc+kflenZVXr136uP2XgD9OmKGn7fKwO9tgI8n1WGEGkVVJPD+YbOh
	 ITt3UPYi5VP6eFPg7giv4LhDoE8Xm6cOo1B1HiY+PRNMVVnr+l3g/94WIzC24HaRLiGMp
	 fO7UXQ+JSsyom2H4LL4mTXlKfr4NKMXQVKdd9O3NVKx+pXyHhhZHMuW9O/0fwYHPBPaIL
	 vS0jxuisA7mfHOspf9+vVuOXwWEAEDbPDe3YxpDUgND+hNn9oKou1r0PY1/2vNWq2zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=at/xFOMf/TfGw2jqS8qkz82KqMX2c6enn0phpyJKM0Y=;
	b=dI8gtrZjsI4on/nwt8MuM/gm21tItdyAyPPXRzebft3/WDa3siEFMxPnKR6hVXdNDmBi
	 hXE38kIYediyWBe2ejnRFnT6ZF0B6i4XRAuKjB+kW8Wyiy1J3Z/gRUyh8m6UFsQppEQHu
	 KOvnrUrc7PhwXjR4S8Zw6xCltoNoxocnNhzrUgcI62hXsU5LGn9BjtTnQZwgjvSx4MIiE
	 dPFxq9T8LWtNU6rFU9Pmecs8YqWXCsoXbDHqr4AJEaIvCPrZAtmlQq0J8kwkjng8rABgZ
	 2I6qValrtQlyWkvci+ZKryWwjdmXiy4D8VPYdSFmgW8kCnKoeWkGYBz6NWybIAjiyuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAF04WY+;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92EC606A326
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAF04WY+
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso393989a12.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793794514; x=1794399314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=at/xFOMf/TfGw2jqS8qkz82KqMX2c6enn0phpyJKM0Y=;
        b=RAF04WY+9cYZC/gyYvFVG40RqyknQWn6cv5K5Nifia6w8JD6P3iNFqS/r45kac3rBy
         TDewzdudLbFnNE5AlFmmPWIUX0wej8cQPtVSPtCrt8mMrebvrHm+EaODOLpdDTNOT7o/
         AyfFhnX1EV7UgxR2sSQToKpjZLwm4fKYFyNOaLrMaz73OaDnYCq80BgMBNpUnnNTzWju
         bPCkblrVuVDKQ8fT4JpoOvcu9qO3oVBXGhKAisbCZLrrrOhS1dUBp+tK8uETxaA89Bym
         BiHaIlRf8BloCA80Kxf5wYAW1sDce0tBOLdQW6YyyYfy6t1lA2asjb/GrFSVRfx5rzHI
         9ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794514; x=1794399314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=at/xFOMf/TfGw2jqS8qkz82KqMX2c6enn0phpyJKM0Y=;
        b=Sbpi0xoeS4Us2sJkSpg/wJpkcXg3SEfhYXRSO3a1n/RioUarP+EzaKU7mBdLQm8wt6
         5iixdX7WSWp5EQYulOj4k72klG9C1L8TfH1iNmOzbXTrVFXXFwbXoNoDlQ6L9NAlDUa2
         gwaxE6rJgzUNJNmT+9ADXMrtw8c3JlKh4zm2tfaYhZBiDYyxLG8RQj4BP/jRzn76PEmI
         tu43aeQUiRL7d5GsWrWbYsjnHEvRbxFBt9Mv7KsR+ZzbGvW4SvGtpDSFwvHMiJ9wRgY3
         JzfSOOlhYYUgyb8pvyy54Rowy4gU0s9avbpu8gX4G7xYYWx0xJihWISZZKGx1T7wR6rX
         gZsA==
X-Forwarded-Encrypted: i=1; AKwUvByUi5vk+ZhdHU4HXA3GkQrQi1r7hVZfkOGhGyrbijePp6Wu19X8u30Cqk5k/ClPN2WAQo3pZZdiZNsl5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z//6ftIlA/2DlWbZT52xy281oHI+4Ux7u+qpr1FIldz+3re0rUJ
	/WLlVFHa7nOh/y3eZjHnHx6mqnsQ38Ut5Vcz3X0scuMHs+6LzCGNakSX
X-Gm-Gg: AYBFou0RG/w19N8N6/U56lwuKkMX0NKDLdeeEhvD3QScD7ITfByLZqs/5k1zPYJsA3p
	6Vw8HxnR8cPV8E+h0pQAjKHIL4tISGUzkjxg5u/mxEnzYIN6MSekBPHOkVEbMnLvg+u059vyk30
	p8MDxxLffOtvrboGm/BpsBzgh0hnJOp+zdzYtof5bwyjdyqC5KgSAcBlAnhY8WxDLMxmUCbfUrB
	S9kyxdM4sI85PY14WvJ3dq8fF+uuFLQCacx2GPAnB0vC5xWUhN7+f5RndTDrkWKyACUdOKzOwxL
	4ycJz+Ia5SMmZyi3CXO1BHQCxCWX2urfV7mc6s5BJQnaBfaf9eZgiyeg38eSfMaRgQ8QACBlDbI
	clhPSOwRZafg7dWQ8CopcPExDbTCN9aVeh3HHZ6DAqsWyeAlm86TA0Ts9OIUO7aZz9t2fgYqp6X
	xIbfuyVjIcAoXhs2bBcWg21gDivb9Mre5N5EvaSdmPlv/cyiqrEkRdaAi+3luL6hY+zJJn2XYBv
	y6cAj24LOqzX7+MqhEotHwIhmsvHR8QXH/Nxb0vGkrv5FoV0WGK43yFPwO2LFuKviUsmW2DKTG3
	V9/nJqUhEMMefRWg7ofgoil5O0ee/cx0b8AH82hoWSwDHJaqXvaStHqX2aeLFOU6/8lm9Tc25G6
	JzRx8CJhLovI9vcvmuLN8EEhZfLyE/Go0frmMXi9W
X-Received: by 2002:a17:90b:1cc5:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ae89879e16mr14073797a91.62.1793794513757;
        Wed, 04 Nov 2026 04:15:13 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944a0ff7sm3855405a91.10.2026.11.04.04.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:15:12 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: ALSA: ump: Data Entry without a selected RPN goes to the next RPN
Date: Wed,  4 Nov 2026 21:15:08 +0900
Message-ID: <20261104121508.3972314-1-sammiee5311@gmail.com>
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

Hello Takashi,

While writing a KUnit test for the UMP converter, I found that a Data
Entry received while no RPN or NRPN is selected is kept and sent later
under the next selection. Both the UMP core and the sequencer
converters do this. For example, at MIDI 2.0:

  CC101=7f CC100=7f, CC6=40 CC38=00, CC101=00 CC100=01
  -> RPN 0/0 = 0x40 (40200000 80000000), with nothing sent for 0/1

The fill_rpn() returns from its skip branch without clearing the data,
and the flush on CC 98 to 101 sends it with the number as it is at
that point.

Dropping the data in the skip branch stops this, but it breaks another
case. The fill_rpn() also clears the RPN selection after each send, so
a repeated Data Entry for the same RPN only goes out through this path,
when the next RPN is selected:

  RPN 0/0 + 02/00, then CC6=0c CC38=00, then RPN 0/1 + 40/00
  -> today 0/0=2, 0/0=12, 0/1=0x40. With the drop, 0/0=12 is lost.

The other way would be to keep the RPN/NRPN selection after a send,
like fe85f6e607d7 does for the bank, and drop data only while nothing
is selected. Then a repeated Data Entry is sent right away. Selecting
an RPN would also have to clear the NRPN selection and vice versa. The
spec's translation rule (M2-104-UM D.3.3) says the translator "shall
hold the latest values for controllers CC 6, 98, 99, 100, and 101".

Which do you prefer? I can send patches for both converters with a
KUnit test that covers these cases.

I found and checked this with Claude Code, on x86_64 (KUnit under UML,
and a sequencer test on 6.17 and under qemu).

Best regards,
HyeongJun
