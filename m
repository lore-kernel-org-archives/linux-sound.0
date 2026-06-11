Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D707C30DEB2;
	Thu, 11 Jun 2026 19:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205513; cv=none; b=HjqTLJUBEBO3jHc6/nbqejdsEpQ2UbNid+Usbn29u94Uj3OYR3ZPMp68DbyzkSbl3JVfeE0+UtcZhQqEumkh3QCDwZ+ndqDBHdJge8qAh2KY3MF+xDyfxLrJqEkXG8tRP1uiGDL5gMbyhqZ3X9gvlYsBLC7kHsXL0vvbrXB8SY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205513; c=relaxed/simple;
	bh=Sit2X2eSGTJc2r0l3cVYiP+fEnd1CMn74+boM+qI/ag=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YV3K/BSOV+LKhb6OyC3xG1D5Fk5p554/pXsw85YpuDkLkmuBwqS55cPGyJlS0+KRqXdUrSvkGMAMa80F72Q7nPkF9C/8lpmmQUUhc7fX9/5By0ZRRJYOv5nUtNBCVZtusisee9RQCbsHnTyzRdxOvJsbkH/8ph4+7plazDvynDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=hkyrCZqp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BZw5FhPP; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="hkyrCZqp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BZw5FhPP"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1B1D01400122;
	Thu, 11 Jun 2026 15:18:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 11 Jun 2026 15:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781205511;
	 x=1781291911; bh=5W7Jc9jUfsvtfrToBDiZns8g5DML1Xt/rM1uqyVwG98=; b=
	hkyrCZqpD4rmnLbVyJdiaS5xNKVXk1pL9zni27LANQWqxgrcF6BHjaZP0psIjnaH
	7USHt583bHMaUmICdHuHXMfMNHJ8qOaA5MUlwAkry4LpPcKTKUbGFMM70xJfuTRv
	XOMZ7qbDgO1fe1bt5SFyZlC2x727uV5tsjYKxWGH6CJwjwYuzAdqEpGku5saPAC8
	0q/EEo6QRSRpsh2rZCmT0lINd+gkblBbumi5m4FuyhibbqGXu7QlCKJa3jdXBIkK
	Z2SEuBUXYuSaOiNn+I83zK3wT0HA7sWBDr3dZtHq9SmRmGxneL6jpWU69bKylcET
	D8fWUVQbKo6hhfLb61BeiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781205511; x=
	1781291911; bh=5W7Jc9jUfsvtfrToBDiZns8g5DML1Xt/rM1uqyVwG98=; b=B
	Zw5FhPPTOJkcUpqXJ3lVNqf0MaZVmwjbwWLkhRlXmNk8cVwS98u0ucLxgibIZCpd
	FDzBKm6Olml2SMlD9NkLH6cgLT07HVKt9Qg4S0zwou6083OR2wwa9qxQstmQkpTz
	KKnny0OzIGEB9vQqdcR2fS8j/iGWaZLDya9oCdDwfDC8g4SxBkKCrmAnl63T6F38
	gi4WWxLAB8WmFFqBIgHxXNCGC7kvk0+qirpEhoZ1Zdtzcg8xQ9VWW3IktpJKnsBO
	fZfw4eEIij1GR0ABajyTHMKe+YhM7f4GsNVH+PHjBNd5Z83dI9uX11PenTx8wCbA
	PwiguWu6FEmvnO2HunTVg==
X-ME-Sender: <xms:Bgorak-esDq2vrb6XJ9au_iQvcLXOohP-qgsMDXQAyJkSEOSuAPgKg>
    <xme:Bgorang10fnc2PGszXp0snzSnR5iAujCKJS5vyRBRps88SOvefZ4eiYwgurKF7vj5
    zDOazNvBjy8xioWoqFchWpIYpWZ5mlP-GGPmJaF5hG4Z2YrqEDHtKix>
X-ME-Proxy-Cause: dmFkZTFe64flvbOOJFDkvGAhylkPe9bl7GmucwdmhCw2/dhxx07/4kCSMJuyODVlkREgbE
    o3UCYughlLEZZ25G95sq5AUleZZKzUzjVLJIEUOWwXR403vl3U4/69y3wQdQ4iyMKnBtnc
    i3oakasxVuFRhFp/0yHI1+HgHrsri05Fyombr0oASMVyMdzIN5M9aHVnz6wm5ZqORFpN3w
    TDUf7tkNI1HjgDxahbPPWj8ibwJ3MYOle6IRjy1tkQkeLlJK3pz0wbZ2YTkEq+d3D+DxKo
    /gS1m6buTInIm49s2Qqoo120IdI/FugQWOoMah7l7af4l0mI9X7zqrYCx1zDFy6qgQWYQg
    BaV0fptZfAq1IxdfYFgpceZbPZqkSTq9YTGu029Wyv9L3CFrP3uvfdjmuALhJd5JEd3doD
    p2pgH8/qDwOwTrG/zMzuNoR6hP0RnwikqMItCpCIZ/MVLGTbTN4D/Y60F2WGfN6DTUsbnp
    3Wu2KmIwrGDDprO9zsSR9sxqlI3bAwjgs22O+38YMFAlJq8Kezp+X9vOz0GInADK293PMB
    2dJGx1mwzYqY+ncqnAQhL+7XHRT1MJEOUOEj5v3WXOjX0iqZNrNRICA5XRTwI8lKATlqY6
    wmhvmswY3ujmrJ5Gs9Woi+msJusP+n6gwNBJkEzokpESnOy5isljGUGyIGqw
X-ME-Proxy: <xmx:Bgorav3tec8rPHN4IE7JnYtItOPU6e_nqrifebeGQah2vKHNZQH46Q>
    <xmx:BgoratrhFUyzt-MKtJsh6v0YHi7q1r9GGtkaz5JYB-b4UWbebJ_Bww>
    <xmx:BgorakOZrjGuRxlodT7RVzW9NnGU68-sX75E28MkFa9PfLII5M-M3A>
    <xmx:BgoranXzraksFAE5Wb_wWpvRrJLXr8u7EESfj5MgUHk_pOuM7ogtbA>
    <xmx:BworagJSXjGCxPOPJ7iwW0AntVnNa5K8bjsW6gEu1JLaVDYg8s6E4XCm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E6E58182007E; Thu, 11 Jun 2026 15:18:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8g0-Z_ty2kZ
Date: Thu, 11 Jun 2026 21:18:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Daniel Baluta" <daniel.baluta@nxp.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <f6da5fc4-31cb-439c-8416-b47627ad45ce@app.fastmail.com>
In-Reply-To: <aisEr9qmav5i23CY@sirena.co.uk>
References: <20260611132310.137688-1-arnd@kernel.org>
 <airEQ7ER7jUF3SQ_@sirena.co.uk>
 <c216893d-0548-42ac-8a3b-4be397a79fc7@app.fastmail.com>
 <aisEr9qmav5i23CY@sirena.co.uk>
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from
 SND_SOC_SOF_HDA_GENERIC=y
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jun 11, 2026, at 20:55, Mark Brown wrote:
> On Thu, Jun 11, 2026 at 08:22:21PM +0200, Arnd Bergmann wrote:
>> On Thu, Jun 11, 2026, at 16:20, Mark Brown wrote:
>
>> > Can we end up with SND_SOC_SDW_UTILS=y but SOUNDWIRE=m?  Though I think
>> > that's a potential issue anyway...
>
>> I don't see that combination in any randconfig builds and haven't
>> managed to produce it in menuconfig, but I can't swear that it's
>> impossible either.
>
> I think
>
>   SND_SOC_SOF_SKYLAKE=y
>   SND_SOC_SOF_LUNARLAKE=m
>   SOUNDWIRE=m
>
> Skylake doesn't have Soundwire but does select the Intel stuff.  I
> didn't test though.

I can't get that to enable SND_SOC_SDW_UTILS, that would
require SND_SOC_SOF_INTEL_SOUNDWIRE to be enabled, but that in
turn has

      depends on !(SOUNDWIRE=m && SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=y)

which seems sufficient to prevent the link failure.

     Arnd
