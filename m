Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793403849;
	b=vcZ2vXnoydE5/OGNlY3r4moPi6Ozuac5mToiUT+JA2WSQCgXoML3wNu/577/lnnjed9I
	 kYZ7nYV/cNky/h9lbAE6NHlfh5D74UfLrrPCXq6zkYfE1k5fesdRzEPCDA6bJuEM9T8qp
	 9p99wYdv7smB1tjv1c3TFwR7c6Cx35HdPJABZYwgO7pFFLRG0qQy3buMXOfOOrGd8PE43
	 khbOBJ73Im6iP2toYQ/wUh8iu7NlNSvA32M6ti55wYG8/ereyAMKl3gF34mRP9mRhtyrF
	 SubQkj7+J8H+CyDr7Cewcno3hbbUykoJPEjqmn0MHypkajE/YAyx3PLdO0gDA9pFbSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793403849;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eOSSfVjA2/9pj3FFlPSahms9VSpKaDZbkgecNlcl/Tg=;
	b=nFCMwkd88YPfnJjooEPdjGPUjyKJE/N9qh9wizSQiGPLH95GCVWJ/an9vf7UnE614ayc
	 ZHhmtn6Zlgs7ZLcDxy9Lty08SIj86g7J7vDuofUm62DUNtUIsMvpWB7nvoCWT1ouUQo41
	 GUGQABuF0rj0VHYNbSdYl3dGwjde7mK4a4pC7tc1wdUfB1kbjP63ElzXCZj828nglWyum
	 e8jgzPE60jvNVHfgUWfKM0Db4M4TRA8x3Bv7L+Pmi9Wc4cfHl6Gw5J4MLTkOwiZamoxsw
	 7KofgiB7hCGKuSEgGgzqLFHGyRNCPBNTiIVNPc/O3FlAixcKbhXmg8z15Hsw6cDETcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=mPtL6ZZ2;
	arc=none smtp.remote-ip=109.224.244.31
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FBC606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 23:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=mPtL6ZZ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793403846; x=1793663046;
	bh=eOSSfVjA2/9pj3FFlPSahms9VSpKaDZbkgecNlcl/Tg=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mPtL6ZZ26462ucnEbI9b7z/HOsGrDcsP9yb+xV0CVm/49voB5YywmqR6oa183vwbJ
	 Vh+Cslunfvlpzt56FGaiV7fxwVwrr2U+nCYpoeytTI8KpyCR44LUtd+sogsVb9XwJn
	 5OfMHOA2VtamAvWWfG5ZsazFs87+AWnJ2ySi4EYc8QxCcCpdxW1MawZ8CYZdl7QwtQ
	 Ps8fOUQX/exjQ7uDMzXGu52P6ld7ud56YyeWXwS+7h4n5eR9bPPkiYN7itRF9vxCNw
	 eZYoDSsaaSN27WHUZrcn0iav6icSX0weosKLrjSDnpbs5yOtCbO9JiXzqC3ycgQ92K
	 6yBNbWhP1Ec1g==
Date: Fri, 30 Oct 2026 23:44:02 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: Ned Blake <ned.blake@protonmail.com>
Subject: Lenovo Yoga Pro 7 15ASH11 (83W5): constant hiss from speakers during playback, headphones clean
Message-ID: <j42YdZOPMn1UBkfj2HTDC9cUW9vO0S1GjRdS8xTrWu35DTCOKAoa6gR7N0ZZF_JX_6_HOjF1Pj0PFqrmMsSlSYTEVNa6IW88dq8caB07pRw=@protonmail.com>
Feedback-ID: 42001000:user:proton
X-Pm-Message-ID: b96b443af932c168800def53a4af9c9760b35ca7
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hardware
- Lenovo Yoga Pro 7 15ASH11, DMI product 83W5
- Codec: Realtek ALC287 (codec SSID 17aa:3960), PCI SSID 17aa:38fc
- Two Cirrus CS35L56 amps (cs35l56-hda, firmware ...spkid1.wmfw)
- Kernel: 7.2.11-ogc4.1.fc44.x86_64 (Bazzite, Fedora 44 based), PipeWire 1.=
6.10

Problem
Constant hiss from the internal speakers while audio is playing.
- It stops when playback is paused.
- Its level does not change with the volume slider (tested at very low
  volume, e.g. 5%).
- Headphones on the 3.5 mm jack are clean; the speakers still hiss.
- Persists across reboots.

Observations
- dmesg: "ALC287: picked fixup for PCI SSID 17aa:38fc", both CS35L56 amps
  bind and load firmware normally. No audio errors.
- Muting either the "Speaker" or the "Bass Speaker" switch silences all
  speaker output, so they cannot be used to isolate the noise.
- Auto-Mute Mode is Disabled: speakers keep playing with headphones plugged=
 in.
- Pin routing (/proc/asound/card1/codec#0):
  0x14 (Speaker) -> DAC 0x02
  0x17 (Bass Speaker) -> DAC 0x03 (same DAC as headphone pin 0x21)

Not tested: other kernel versions, changing AMP1/AMP2 gain.

Happy to test patches and provide more output (alsa-info, full codec dump).
