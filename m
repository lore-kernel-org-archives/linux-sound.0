Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B883976911
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708689917; cv=none; b=PG2s2wUnyQotnK6B92FvntM1VZ9TaT3wQJq2p+vJck6M4sk44nrH7qWz9mnuA0cVjaHK20+VH/QVfoK0cnliKgc6qKr2A32JCiC5e2v3YuxrvTTMl7evTR72qD+VmjNQpGauPDgqIJr3uOjozuRwfzG9kYLllynqpYoaCGS9QDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708689917; c=relaxed/simple;
	bh=Uss0061bhaxFEQ47y6fzS5ksNA/14JRXVvwHisCvJ8k=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=bQ1Bd9RaCnQxs7UuXOLfkYFXyTA1LlLzQJCNww7kRfTab2iIIhqh3G3IRrIQL4+kMLzh8dPW473QXKIJvt1tb4UxwKomjXUuMYBuo22tHM9W/tcxnsVwODUY72wudW4QthPLgKB6m8MPZp3hGb4kxQ2vD1LxwG5tgYSdyExiFps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b68dc5.dsl.pool.telekom.hu [::ffff:81.182.141.197])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000752A2.0000000065D889F9.001DC376; Fri, 23 Feb 2024 13:05:13 +0100
Message-ID: <d5b42e483566a3815d229270abd668131a0d9f3a.camel@irl.hu>
Subject: PCI SSID and Codec SSID collision?
From: Gergo Koteles <soyer@irl.hu>
To: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
Date: Fri, 23 Feb 2024 13:05:12 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

The Lenovo Yoga Slim Pro 9 14IRP8 has tas2781 amplifiers, but it can
only pickup its fixup with the hda_model=3D17aa:38be module parameter.

The 17aa:38be is the SSID of its Codec. The PCI SSID is 17aa:3802.

The patch_realtek.c has these fixup:
SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021",
ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual",
ALC287_FIXUP_TAS2781_I2C),

And the snd_hda_pick_fixup() picks the former fixup because of the same
PCI SSID, but that is a Codec SSID?

At least it worked without that line.
https://bugzilla.kernel.org/show_bug.cgi?id=3D208555#c839

It would be nice if it can be work without the module parameter.

What is the best way to add this strangeness to patch_realtek.c?

Thanks,
Gergo

