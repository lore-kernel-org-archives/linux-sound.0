Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB160260
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708701034; cv=none; b=fBSgvtmXludVmGB6N2oQ51dPtJO7IM45KvCsPnxb8ytZMdkxSyJtReN00/xC1+gU5joib3R+3XF1CSJCaMP2yYp2JnVuTMeSQWy9YnEMmIQPnZBHEYJbDD3Fd70eS+8bS29QXGIDD54mTkGPP5lxFC6rsOj3jNQXkKL6RU4Q/H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708701034; c=relaxed/simple;
	bh=Y6eIDmiVmNl1Zxowb5V6ppGEIHwpZtVT+AlFM2a5we4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ePx5YbuJfQrSIE5rUMVG3Y4TcKvrsYEXIlFN2QPknUEKqZpLYwcfchMNcRtFKrBfw8OhB44T/xWPkTEAUNczkdSeR5ycozsmW61/oMYB86ECQXCy7qYDM0pzKwR0+ZrxUrSPuzLgxmc36Fg1xbc3bZS1hngfF10Ctsv2YBbg+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b68dc5.dsl.pool.telekom.hu [::ffff:81.182.141.197])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000075348.0000000065D8B562.001DCA93; Fri, 23 Feb 2024 16:10:26 +0100
Message-ID: <4786204abbd7acadd27a8cf487be91e524eaa444.camel@irl.hu>
Subject: Re: PCI SSID and Codec SSID collision?
From: Gergo Koteles <soyer@irl.hu>
To: Willian Wang <kernel@willian.wang>, tiwai@suse.de
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Date: Fri, 23 Feb 2024 16:10:26 +0100
In-Reply-To: <170869932581.7.612391552809015627.273152461@willian.wang>
References: <170869932581.7.612391552809015627.273152461@willian.wang>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Willian,

On Fri, 2024-02-23 at 11:41 -0300, Willian Wang wrote:
> Hi, I'm curious about the reasons for the fixup table to be the same
> for PCI and Codec SSIDs and if the PCI SSID is usually more important
> for it to be checked before the Codec. Anyway, would a simple
> conditional statement to match these exact PCI and Codec SSID to set
> the fixup manually be enough? There seems to already exist a manual
> fix for TX300 and ROG Strix G17 there (not the same kind of fix and
> with a FIXME comment, though). I have this exact laptop model and
> would like to try to contribute to the code if it's not too
> complicated.
>=20

I think it could be simple, like this function:
alc298_fixup_lenovo_c940_duet7

Feel free to contribute. Easier for you to test.

This can help:
The output of DuetITL 2021 amixer:
https://linux-hardware.org/?probe=3D19173612af&log=3Damixer


Regards,
Gergo
