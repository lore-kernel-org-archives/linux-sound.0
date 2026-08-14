Received: from mail-200173.simplelogin.co (mail-200173.simplelogin.co [176.119.200.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A4B3F0750
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743929; cv=pass; b=CAf+pVxcxLEgBkLdPrunEUFw7a9V1XH0TDw+wofTM7BxbUblZS/nzEoRaOFSjbEbR4HWjg8JaAyiuTo+Kxl+ux0JAAYslGiMo6EBFXhsRtrS9PHSFZ3xVZY4+XbgCO9Qid5ivM4Ux+zOvZip4lhcnbajHIPrDCQqPLN+6DXB4po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743929; c=relaxed/simple;
	bh=uCyHUHxTcj6Jf5efnhwigeUIOVhpZxUWWzLlRNyTusQ=;
	h=Date:MIME-Version:Subject:Content-Type:From:To:Message-ID; b=mZEkEKy0tLpZnYJSmzfSUNORmhLST5/J8WL8s2TUc9kah48W3s84SVbbfcBS9UYEuPvHNL7CewcLOuhNwtX6AVKUcfMiRVo31QWSJl4eLbHpZncl4l3b5u3MEp5yQjhJOPCdF/hVcIiuTu9WpiYJSLQPu1w2DfZtOWjBIxZJy7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me; spf=pass smtp.mailfrom=slmail.me; dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b=Rkk5ZtJq; arc=pass smtp.client-ip=176.119.200.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slmail.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b="Rkk5ZtJq"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1786743925;
	cv=none; b=P4e7xldzqmqK3uk61X7YM5SS0GPE/I+bbtUY6uW50YP8wd2cLDaKI2Ll778bKswklN+qmxbCib6ItuzEPLQ8Q+YAT6HMduTqFVC9kRECX2YrXFn3Y4Y8uL5ysqibMsdhI4IiLpf48Lu1VYfXil2fsf2QDNXpgLX3IPxnX1ZEcBULwC8x+hkjye+vlbixgSvzjyBPBc3/plk9At0bblFr/dSiyeu3SAx0XJArhrxbA9C3fbT6KonsADDkIgtgJOMTrGZX6rOqwvEazxk9EjnCQRqmeOp6jLHOstZgMj99JOK/YDc9ziLQnNmlc3n0hrKkOlVpejKLYLAlS8QeBWjVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1786743925; c=relaxed/simple;
	bh=uCyHUHxTcj6Jf5efnhwigeUIOVhpZxUWWzLlRNyTusQ=;
	h=Date:Subject:From:To; b=i3QRM6pQPOD3aJIbckHOLb0PE2/113QfaTx+LTVDnnt5JBojX6VeysUNraqxeBaach/jXN99U/eayIzBQUwyFYrsZGh9lMPA+/WAOuUUb1jkcPmWacAms4CBPeaUg1ZDxB+VtNtQsuNT2PiRGduOyhmDM3IB4kDx5bMxAf5ez/7cLmGXHhWJhOg1lBFaof4J+/k8xPGNnTt7aiJwVwaGgvHNu6pTHw86TBYfvIFxtEN/FqnDWZgZRMQ9wEJg3csVXDGezTRiJxipS4Zh8v4TS1zImnQpbWHUBNIMWgzBs6vlb/MVl2VJ4ME/w9qox/TSlAkWdUThDYpKw3ptJ/buVA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slmail.me; s=dkim;
	t=1786743925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uCyHUHxTcj6Jf5efnhwigeUIOVhpZxUWWzLlRNyTusQ=;
	b=Rkk5ZtJqueJyY70M5vOXIXVw8M+iS9140C1syiz1FfVx15vd0Ft3MO00ZAa3aHPBai/Pf3
	gb4jIIXowLfZI96PKEH6TyVYtOOlYzxgAWveJa3o5F/oKPtlYKUmocKUqbW75ugJHnDtHR
	rCVTJJzEnax2Ss6j3CP4JKOtlZOfCFs=
Date: Fri, 14 Aug 2026 22:45:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: snd-hdspm: add PCI ID 1d18:3fc6 for RME HDSPe AIO firmware 200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
From: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
To: linux-sound@vger.kernel.org
Message-ID: <178674392532.7.10140952469564861620.1550442282@slmail.me>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1550442282
X-SimpleLogin-Want-Signing: yes

Hello,

I have an original RME HDSPe AIO PCI express audio card (not an AIO Pro).
RME's current Windows driver identifies it as:

 =C2=A0=C2=A0=C2=A0 AIO, Revision=3D200

After the RME DriverKit firmware update, the card enumerates as:

 =C2=A0=C2=A0=C2=A0 08:00.0 Multimedia audio controller [0401]: RME Device =
[1d18:3fc6]=20
(rev d4)

The current snd-hdspm module only advertises the older alias:

 =C2=A0=C2=A0=C2=A0 pci:v000010EEd00003FC6sv*sd*bc*sc*i*

Consequently, no driver binds automatically.

The PCI revision is d4, which matches HDSPM_AIO_REV (212/0xd4) in=20
sound/pci/rme9652/hdspm.c.

I tested the stock snd-hdspm driver by adding the ID dynamically, with:

 =C2=A0=C2=A0=C2=A0 modprobe snd_hdspm
 =C2=A0=C2=A0=C2=A0 echo '1d18 3fc6' > /sys/bus/pci/drivers/snd_hdspm/new_i=
d

Result: The card is working 100% correctly for single-speed clocks=20
(sample rates 44.1KHz and 48KHz).


Could PCI ID 1d18:3fc6 please be added to snd-hdspm for original HDSPe=20
AIO cards using RME's DriverKit-generation firmware?

Please let me know if additional tests or diagnostics are required.

Thanks.

Regards,

AtmanActive


