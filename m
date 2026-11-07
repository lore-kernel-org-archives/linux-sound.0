Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062068;
	b=epxVKrp6KPBt4UPvPvIcVznqASlJbJ5at8v/nKJVWoGdlFQKt8ayofoJz0C3Xs6JDfkN
	 Ag1rGbBgY7HQX5xM8UEOIXzcQ1EDpVEXscUca21HhSPpX5oJ0+0+eGdeLAXa1A5TcBRMZ
	 CJBRIB0Xv4hws+qYpKhoCuyT0MwjQUo2rSY0VWrQJ555goJi14Df5inPjuoJurFz/i54p
	 P0CE3kbwsyc64E36UfGlC3j0XQzj1I16Q64qjIHgyqzZ8m3Kw0wJCZ8VW8OsP9IqPAhHr
	 EZvPWA9gjVHPP1s2acKohBOz10A+Fd+wCYeRjoVai8B4PtdmjEA/bBFoDk4bt9Q/hrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
	b=g7a2vTtLBKOKzGsbKZZOIkt9Xlt1D3pMV0zDXoYXvNLF9lN/RdljRtt21efRVzhFnyxV
	 pnOEFxN8ZcJrUmyAPnmvoKpcc0PPeyuXBr4LKccvCmwh3qf4/mINCiKDONfwlEIcnmIKK
	 4q/l2ayzd1S8IlB7tKBdzPwJKJ11pyJrqYJvxAK//fF0fGSBUj60N5iuTuVxOJZV8wS3p
	 VzeiF2u1kb2UYI9kybKFvdSy4NKCXL97ijn5iRAqkHl/d0NP/vCS5mrzD6nvNIx8m8vYw
	 MM98oL6cPHMdG+hEwk8pYTZSy29dg55TPWU14GW2aCVENdblHD+3IUUeCwKZwt/PMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k/R8jpmf";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469E1606D81E
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 14:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 469E1606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/R8jpmf
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fb88ea38cso670700eec.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 06:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062067; x=1794666867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
        b=k/R8jpmfOfJfq09NGfHnd11AgXL3mVYVqfHKIqKiP+jSRBnkcz02FmHvEadYIgV8yE
         0dPt1XcmXl13xxtkUH7KoamOPyumrG9iT4cnDz710OQTxc8VsmY6pPbKevs5sqkdyHLT
         WoEDw8boiklHcAwJ/TbZmknA/GYYb+gSDZ6Y2WhjO//yoOuMHWeQFUtEajTmMLDjN5va
         JWQwam6fJrEIhVVCalG18yHrb9kssQ15J3Zl9uOXmeoygSoe4YEk8N/QCW1afc5C0SBw
         n89oVoOijyMmneT80QZKwo72CJ7Vfti7v3wOXl556zYIOHeCwqwKgTrZPrgCMWdr6DtO
         9nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062067; x=1794666867;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
        b=wTqIa/Wf8B4OvEAxbIoJt387l2UE5KnKDSJS3DU49vy8N3J0lTzL0UsrLebv1sFjw9
         k0obYwypPv4IU5NzAmXUuvQVhWSf0xa5tRZYMe67WRzrIrLgI8lE05xaqF/vX3XeV9Sz
         KeRSmIdqcQzkMdbUZ191FmurAn0bX1bh09R0r7o18DowCFFylNsuQ+xcW/TENpHrTt+a
         ouXSBNPHBTt8y8NWVcAEAV2ijtT7Ii5LD8/XuyxBAO+Ai4Cj+hznqtb1SIlRmdn2I8sP
         zYiqtI6fLToyhwueOzPWENRmTnrJeZ4khzhv4XjOSE3UB0kYzQzDtF8tcan4KZJx+wAb
         ZH6Q==
X-Gm-Message-State: APuU4Z9g/+ViNzw9j47NE2ohhDSrWFnKxGFxjeU2Rb9pEF5J1ymuvWTK
	2mIMugucz50EMMmvrSKzkTRvkwvt+B8S6l8liY/273Ug9L2PXcrvb3VxF1XMjBV/
X-Gm-Gg: AYBFou0CrkvNcxESAMk8+iFy7ZMkSBJtP0ndZXPPSJcnhTcCHUO30UUZDwWMFXtPxIg
	zpk1g80hvorh1ZI3tYs8+u9C79m3ZDTsU3EQfIY5IDBTfPCIPSj8Lqhb//lGgq9DYxe+BBJ3bfh
	fZ1kUIXrtoc7BBP6uAZMU9ISpVu1hjJNQBf1pUNdGXx54QbuHLaZKSu6ptjO/4NyJlVduhLQAvQ
	LDFE+Ng4RJJzuMrW1xLObHa/BC6NMBEg6jx7Hmwt5BD///cLXgruou5G15bWKbef/lJUF2CtOmq
	vWzpsSF7rqJ9n2Wxgj3PQ2JjELAX/x3MhicwbftmtI1AWAMQHz8qAOX5fr20gYhlZcdBQA5BDrb
	uioEhXg3P18q0KIl9a8RhR4ceOcF8V3TbrT8J9GZ0+aNPF4nUURmoz19KVtV+UUfGYfLKK7mx+l
	c1KXbPKHk7FjLGgP+r6RZP18As72JdckGf9vFDlpZvDMJJvbo0j832VbmndcQzqcJ3lQwxew1oB
	B0UhQVDsLBG8tun5afSOjjz3dcLKrB6LGBaRsGSVl6H7BhwH21KW9rPhJ/r/LGOoXEl4dP1dBXR
	GTSqPZkvz/fyn+0eSgsPMHB7qNjsJyd4SyBGIhFmr+y3QyHa23JzfJbrhZFyS/7y79nn7iBLH1K
	XR9qJg3TscVSLRRUvv+fYNTJJD7+iV/0w0jJgqfLUJZZxew==
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr3070962eec.14.1794062067100;
        Sat, 07 Nov 2026 06:34:27 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:26 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v20 00/12] ALSA: virtio: fix capture accounting
Date: Sat,  7 Nov 2026 23:34:10 +0900
Message-ID: <20261107143422.29319-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This cumulative resend keeps the twelve-patch series on the same base,
a4311e9447bbb219044db38897f95be112f46a8a. It covers PCM stop-threshold
sampling, locked partial-progress reporting, the optional reset operation,
VirtIO ACK error propagation and recovery, PCM and control DMA ownership,
signal-safe teardown, staged capture lifecycle and work prioritization, and
capture parameter documentation.

Relative to v19, patch 6 moves the virtqueue initialization summary into the
commit body and removes the unsupported event-message ownership claim. Its
source diff is unchanged. Patch 7 also rejects ordinary indirect capture
appl_ptr advances that are not aligned to runtime->min_align before converting
the frame delta to bytes.

Validation:

- The final ARM64 W=1 build uses KASAN, PROVE_LOCKING, and LOCKDEP. The
  cumulative stage build checks patches 7–12 incrementally.
- A synthetic exact-validator case rejects an odd frame delta for 4-bit
  samples before indirect accounting changes. An aligned sub-byte delta and a
  byte-aligned frame delta pass. QEMU does not advertise IMA_ADPCM, so the
  sub-byte case uses synthetic runtime geometry rather than a real stream.
- An actual S16_LE capture accepts two half-period ACKs for one completed
  period and then recovers a full-period read.
- Ordinary and staged capture passed RW and MMAP reset/reopen runs. The
  14-segment oracle matched the QEMU sample sequence.
- Inherited v19 raw SYNC_PTR and paused-lifecycle evidence covers the existing
  accounting state machine. The transport timeout and PCI evidence covers
  unchanged control and teardown paths; these references are listed in the
  manifest.

No physical-device validation or KCSAN run was performed.

Previous version:
https://lore.kernel.org/r/20261106161838.94308-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
