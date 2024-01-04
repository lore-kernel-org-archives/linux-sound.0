Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com [136.143.188.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B3225D7
	for <linux-sound@vger.kernel.org>; Thu,  4 Jan 2024 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zoho.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zoho.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zoho.com header.i=dufresnep@zoho.com header.b="gbzsG6M7"
ARC-Seal: i=1; a=rsa-sha256; t=1704393066; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e7iFKZHqrV4tj6Jl7p5241TL8hYv70+9dLYL5xRJifjfE17DZRFowVPaeN+lp023wmhL5BFbGCmksYrf77zzM2eG/1YyKO0QsCK/r0LyGUAqqJHReYLTlWQeXY85gEyE8WBnG9CyE1zkDpcuBmXSnq+RUZkGjMa+n/T/0Lc1yD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1704393066; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=e9UhHRUeR7tQMI2DYuhqUv4mvVXlx5qgcflbG4ffDVo=; 
	b=Z3OnLKB1uDrc4y93a/WvqIKbg59EYsCuoDDXx652aEq2pNcLtlcfrEM1SOqhDcGw26hwdO5fZYMhtN2SoUjD1N9mUeXUDnr6l9McoU2jxnqUUsjTkfBaXeRLeiG+ciddaSwUbBhvl0HsZlzmjMPwNtoMR8YoQtKgAj/of0tCbR0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=dufresnep@zoho.com;
	dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1704393066;
	s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
	bh=e9UhHRUeR7tQMI2DYuhqUv4mvVXlx5qgcflbG4ffDVo=;
	b=gbzsG6M7RqKiqhkAsWSMtCjDFuOoxf9sgTFgK+7Z3IyXz2DH9ut4CkAjMyvXJ5gG
	WasaY7E6yvnLdq9+lZ4M0cheBJn0PIO3w8okoBZYTSsLjhgC5p1uzSmWkoNsmXwOVve
	CeWPGxI+1WJZ1zfQGAyVLMVh7wGoKrJwZddlin7E=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 170439305928271.97921450082617; Thu, 4 Jan 2024 10:30:59 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
	with HTTP;Thu, 4 Jan 2024 10:30:59 -0800 (PST)
Date: Thu, 04 Jan 2024 13:30:59 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "linux-sound" <linux-sound@vger.kernel.org>
Message-ID: <18cd5be2bc7.e19fbd7b17331.5233193232348276602@zoho.com>
In-Reply-To: 
Subject: Sound Blaster AE-9 freezing boot
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr08011228e551e90cb0c0a5ae6bcaf7eb0000ed54410245a3db788d15d6c5c8e2f909d87d2b52d9ed18129154:zu080112271aa47fb4a24b785bd74fb727000073223816b246ebe54fce453c12ffaeeee577565ef51d929a12:rf08011232a283ac8e4669a5cea7ace7e80000ae2bdee5c14c6decfadddc3ba65e8477f18d66d0d6abcc78e6a190a42b5c3776c51da701:ZohoMail

My friend have the following card:

04:00.0 0403: 1102:0010 (rev 01)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: 1102:0071
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O- Mem+ BusMaster+ Sp=
ecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz- UDF- FastB2B=
+ ParErr- DEVSEL=3Dmedium >TAbort- SERR- <PERR- INTx-
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 32 (4000ns min, 5000ns =
max), Cache Line Size: 64 bytes
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interrupt: pin A routed to IRQ 1=
1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at a4604000 (64=
-bit, non-prefetchable) [size=3D16K]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 2: Memory at a4600000 (64=
-bit, non-prefetchable) [size=3D16K]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities:=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel modules: snd_hda_intel
voir https://ca.creative.com/p/sound-blaster/sound-blaster-ae-9

Using snd_hda_intel.enable=3DN,N,Y to activate only the Sound-Blaster card =
I get:
snd_hda_intel: probe of 0000:00.1f.3 failed with error -2
snd_hda_intel: probe of 0000:04:00.0 failed with error -2
snd_hda_intel: 0000:04:00.0: Disabling MSI
snd_hda_intel: 0000:04:00.0: Force to non-snoop mode

as last messages while booting Fedora 39 with debug on the linux line.

For now, I am able to have sound from the motherboard using snd_hda_intel.e=
nable=3DY,Y,N.

I would be happy to try a patch, that could help to investigate what is cau=
sing the freeze.




