Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE6F31A7E4
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506133; cv=pass; b=m+obsEs2m00mEQ2t08BbZALWlGmB/HNUt0ecx1Y+2MKS5lU1ji5AUPqXkuasw8xhcmgM78g24TlhS4i/0pxbBbF2qUMCumYgD9OU5tQy7zWCTwdVIMQmqvpSxK6BSeDBDnh6sv0WMUauN1Vk+NuOxfexyZPo6sHg5TAiFslcIPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506133; c=relaxed/simple;
	bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=X19nBuaZtiNX6myGY73ZeHgdm0QWdyCTCBWFMQJy50X4fU7VsOcJe/L6BB1Tc7MIu5639d1ISOk9MUW78BtwRd0QAkMm474qeEeRRgJBYoYlWeNtUlTxiXYtpSrAqYcqdMbLDojd3cqcl2lpZs9YziLp7H4l4hm2aJ57FSv3UTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org; spf=pass smtp.mailfrom=oasis-open.org; dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b=g7stoxyz; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oasis-open.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b="g7stoxyz"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88fca7bce90so13888606d6.3
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 11:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768506130; cv=none;
        d=google.com; s=arc-20240605;
        b=CweNmbOgcxqKQWGxZRFdUiTeIT0IknqUyJKykciYZ4eF03orVpoL/4jF0fn5PRdprQ
         jSEC4pdNa+Tg6rUEKzaKO5cYhFywlLQ47Q5bgXYailRp+FhAY8y/onmoor8vR+U+vfaC
         aNaANKiUxsuJgEEvQBRqgWgogCaNoDVFUEPuI625slXtuEIOKrJMygSl4D5KndSALHW7
         qWzqFFfbjMPV0DhYNLQPnneHYgbheIraaj6AvmL4TQhWySboeBdiRL6VT1PQr43Sw6Pp
         vuyLkBWFpzNzDPBW937YCg4FzCre+rXSB/ctDhIVThKQTOeXg+v3N98BgQsj3QzeeKLo
         pQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=j4vhtpF0rn50EndXlp2Z/tcRKuPXRsGetR79Js1f4hFQNkjw8yAeh9XfHkzh/L3GSB
         ttC9bY+jK6vt8P5QbZPRB1wiqe+RSlRg5VW+r1gTodcY3LC1UQOqdVHP1qWhzWBPDYoV
         F1Mz+9HXQulGalvWiQAHBstpE5uXZCbn/WsuI4aYNPk02d/sBagUuKgOLUvWfRHfpDPq
         K59kxc033PgrXCvk5wmJyiEZD0wFSqMnyYkpUojRdrwPChXT5ddzC+SUejPIz3QlBrUm
         Vmgu4gczPF5u+M4uIpPw8O6Le2E+kN97Rq4t2jiOPfpt5F51KQEtq6oG9PmWptj40ONT
         vWqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768506130; x=1769110930; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=g7stoxyzz6JIeH6o5V7lpRk0q8Nm8YvBf+RCEEK4aYqE0Ea/RkwjYak5rHYKkMpkMD
         LQS+wRznporRlk18CS/hZyP8uJZrBhFG+iFwK4brJaYcTVfSlwCxB517pa3sxQUK3R5y
         7ZbD4Y03jl12pZ6hbLHuG8t3oKTHWGXIkZN7M070nPK9nI7RhvX6izJcvY+PpcYoiO9C
         O9Ra8PNuFXxPRyBOcnvUXA/rD9E+7xrt3MtF4zAhOfsGKWU0EroQtFSXmIKgvEEmYyL0
         0ETP2C5r0ZHtNudZxOuljVoFTlJ4upVDtjS/vVUBTFeM9glSu3YWlP4sQUCYn7NXtCBi
         m1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506130; x=1769110930;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=Dp4Ur21Zh1y3vS1yKAOSh9d3KL1fpaLjqy+Um5qCeor/cH84fu/sykpukgdn6KwS9R
         aVzRskgyckVgOvW15uGM0X/aVriLKWCOgxKprtXYjsH8xLa4WkMHaBXJ6pWXuk12Kssr
         8ZkpxadisemaZx/lSt1MIjgXswoJ3FS4A8qJ/vjo9JBdBT4GACeOmgSoXbx6rM9fr9oU
         vp2OphdO3T2G9F1/I8f88QcwRoO4lAWdHHBqrCC2P/TpSaRx4hsJSV6GFes9HHja2SG+
         wDpLQwq27VF0Gis0b5b6A+r9t4hnVILZ2ZaR51sDlHbbwA/VODxf8XU0WPUHpn2qnmmc
         5yuA==
X-Gm-Message-State: AOJu0YyGShOON7xKFPbo8yxrQ/p/z12fQlsqbvg4LNVeDUW/DWSoB0+h
	N6RG1Kw2KgecIHbDGMj1yQZGNgVo1YQdduniWlV4z8WDUl9CoXrTDwjuz6WASNY60gm9YK0xS+Z
	XM3rOCZL53UDeuWGS7B9FUX4hZyqEju77V1HiiAeemhf0JH0F46egETQ=
X-Gm-Gg: AY/fxX5cu4rOp0MhFlL+kCjsMG4jT68AmzOsWmRn2wyDEaUtYodsxCmYjSwj6ChSXP2
	6aynp2gbZ4cGVTHwLHQF6X3YYMY3AwUdErte4+rWarURgm5khxLVLJ9He+jIa1dmFEM/QVHj1/P
	er6cxkeZ5I4xzQFMx/lWMcHm19XqPCuIJnI1WR1I1JVi5jGaNZ/fPw1uNV93Q/ODVG2yABSqrZF
	SGS1+UqqBR9oYxJDuidYjDoO/rCO1MiowEDlGG2jTjLKnimLUSHtRoR6rKhgQdbHeWzfrv/PndE
	+kkdM3yCNc35yPS+N1uvSOdVDWEtGG6Bn2EHaMdSdkdI1lLhXsKpda3jEzjE
X-Received: by 2002:a05:6214:2583:b0:88f:ca80:2b98 with SMTP id
 6a1803df08f44-8942dcf5b2amr7545216d6.27.1768506129650; Thu, 15 Jan 2026
 11:42:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Thu, 15 Jan 2026 14:41:34 -0500
X-Gm-Features: AZwV_QhPrBA1USmJKnxycS7V_YDquwPERLemL7LfYN4BochVOlm79UizP7V7RQQ
Message-ID: <CAAiF603hgMQ2+STZ+7vhcZPPTQRA9WUG5OHmXrxiR9i5UbJhWA@mail.gmail.com>
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OASIS members and other interested parties,

OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01
is now available for public review and comment.

VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device
Specification.

Virtual I/O Device (VIRTIO) Version 1.4
Committee Specification Draft 01 / Public Review Draft 01
09 December 2025

TEX: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.html
(Authoritative)
HTML: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cs=
prd01.html
PDF: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.pdf

The ZIP containing the complete files of this release is found in the direc=
tory:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip

How to Provide Feedback
OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and others, whether OASIS members or not, for the
sake of improving the interoperability and quality of its technical
work.

The public review is now open and ends Friday, February 13 2026 at 23:59 UT=
C.

Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by
sending an email to
virtio-comment+subscribe@lists.linux.dev.

All comments submitted to OASIS are subject to the OASIS Feedback
License, which ensures that the feedback you provide carries the same
obligations at least as the obligations of the TC members. In
connection with this public review, we call your attention to the
OASIS IPR Policy applicable especially to the work of this technical
committee. All members of the TC should be familiar with this
document, which may create obligations regarding the disclosure and
availability of a member's patent, copyright, trademark and license
rights that read on an approved OASIS specification.

OASIS invites any persons who know of any such claims to disclose
these if they may be essential to the implementation of the above
specification, so that notice of them may be posted to the notice page
for this TC's work.

Additional information about the specification and the VIRTIO TC can
be found at the TC=E2=80=99s public homepage.
