Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AF7393
	for <linux-sound@vger.kernel.org>; Tue,  2 Jul 2024 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719881180; cv=none; b=jTPsitL88GoepEC8EZT/Q01BnOLG2ndIT6g2XBFXzb5dtMwvQ6wPl46nKY8VP8Nzms8ctrjsw+tvOOZxG+fScFv3jVOkib8YiZSw3mitgNd95l5vFPntfiszkabsHwdZAsoQi+bCXU06KLH5UQj5x27qZkPscxt6JOrdhxh9qGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719881180; c=relaxed/simple;
	bh=2ePwgFLZ9A6ZZGf9AtXVkoTftOqxVCCYzABtgTqS7eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGCNkGUqQmZl2dox+ahWakelDnduPMM7+kab9FEX8muNP5r4IOQaey1W/bCr85hUp6SabvvtWWFZfpmHQ4YtxqqyioqqAM7w381oOlGrvsTervTN3+T9cwZxELkQ/FQuwWAAUttObI8WXeCYKbss4BhFeE6yB3lw61lBuwCmeHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=SRSj8f1b; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KGYiqB1o; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="SRSj8f1b";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KGYiqB1o"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id EBA93180006F;
	Mon,  1 Jul 2024 20:46:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 01 Jul 2024 20:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1719881176; x=
	1719967576; bh=xRi/7GTfI7x8SLxK6IBV7afLVVk0uQg7yZxQsKhYubk=; b=S
	RSj8f1bYVjoJmPeIsIzybVJjzgnE2F3ylH316Sv/+rnYL17pF+jSWKaSW5pQ8IGJ
	JDXHvsj99tZqK4Mqm56mZQP28Pttoh1zunc6FtKofloM3r2k8dM9T0yOt56pd5i8
	yMTr09DCBBFS64uyVUuhDJjcLpfjbohpgnSoeF0pZyJyGvrkia558wa+gby9158Y
	XnVEWklH4dBaMmxjqxI/HrlD/7Tsf1UT/ugtPGoP9J/2y3f8UgokUhqpZxPIymLs
	HYhFqUdNcPED2oZ/ROC8NPmHrfaBLHZSw6SYBc7Tujtyq3aXNFCJefMUEADg74vX
	HiwBGxKvYCTGYuVWxB+FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719881176; x=1719967576; bh=xRi/7GTfI7x8SLxK6IBV7afLVVk0
	uQg7yZxQsKhYubk=; b=KGYiqB1odTWPXE0EX7OCdbld1bHGVs+I5jnIw08W7+Nt
	HnCrXAV3mZAEVgb5jxG1sXR2fQX5sTfIB1KaooP3w207Z+2po9rSyUBGK5a/oyx3
	ra/eTJp0Jf4+LTeSHfw8iTZk+26Q1a2sFi1WoQPUs5n1CykYd0u5Hu+7TOOfidyK
	/OV4yJil1mjZqUKdkin6ZNmRHCwN03E0v9HmKg4iQ5i7/BuvLA6We0p7eS2RHtUH
	lYY6AOUXp4luxKYrjkjJfFEtxV+8dQLaqFmjEfEyQv9g18JmcqJPhk1EyI7gzTNC
	qNAt0d98ojDrNV2AOwjY/rtrm99RNycXulx00DSbqQ==
X-ME-Sender: <xms:102DZgsEroWmSpq2KSG-6gGRZPwA5v9t-clmoN6Pg5ptzO8T8Rv98w>
    <xme:102DZte2087dlAzsIs8E6Z8EUgihR3Cf0RPoEQoWZglx0mvY1euV06D28_ekTKkyE
    xZToAo2JnWhdP4oQJ8>
X-ME-Received: <xmr:102DZrxb_j3eDknQEv0bk6KAr1pFlytjltmnRM_qROgmGz4LDCiQF2gGU-GgbjDDXgxqRSTZSpKxz8VT6xZeaPCuwgT0ITkduVE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeggdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeduheegueevteeuvdekkedvgfffleeiiedvlefhteet
    tdevteetgfffgeejfeelkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:102DZjNj68nFVoXt2VGRf2d-UYEcUU6c5bhicvU_H3Dxrc3FRzGZjw>
    <xmx:102DZg_ToF3Z9L9A0fpRH1hO52Bp5t39GL4WvgDVRWcYmAMoV8tf1Q>
    <xmx:102DZrXz0293j5Gfjfhh6a9KGiiuVBvvVsmrn2NS8OgZm-P6THe2pw>
    <xmx:102DZpfzrB3HWBmky8ds5uT0okVhIQqzDisiBp3YB9Ve_MQt6WxdXQ>
    <xmx:2E2DZgyCoO0kqdr9BL9bXTUX96mQqk4vxJLvVHjUO58HRqWU3vDFhJnZ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jul 2024 20:46:13 -0400 (EDT)
Date: Tue, 2 Jul 2024 09:46:11 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: Asahi Lina <lina@asahilina.net>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
Message-ID: <20240702004611.GA1029857@workstation.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
	Asahi Lina <lina@asahilina.net>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
 <8734ot42oo.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734ot42oo.wl-tiwai@suse.de>

On Mon, Jul 01, 2024 at 04:17:11PM +0200, Takashi Iwai wrote:
> As Geoffrey already suggested, the matrix size can be reduced since
> each kcontrol element can be an array, so the number of controls can
> be either column or row size of the matrix, which is well manageable.
 
Additionally, a snd_kcontrol structure can provide multiple control
elements by its 'count' member. I call it 'control element set'. It can
reduce allocation in kernel space. If the hardware in this case provides
software interface to access to all source coefficients to one
destination at once, it is suitable in the case.

For example, assuming the matrix mixer has 34 destination and 66
sources, they can be expressed by 34 control elements with 66 array
elements. A single snd_kcontrol structure can provide them, as long as
they have the same nature. The control elements are identified by index
value.

Once I talked with Philippe Bekaert about the issue, then we found another
issue about the way to distinguish both each control elements and the array
members. The usage of ALSA control interface heavily relies on the name of
control elements, while a single snd_kcontrol structure provides one name
and all of the controls provided by it have the same name. We've
investigated to use TLV (Type-Length-Array) function of ALSA control core
to provide channel information about the sources and destinations, but no
further work yet[1].

I think it better to have another care that in this case we have restriction
for the size of array; e.g. 128 array elements for integer (long) type of
value. The restriction is not the matter in your case.

> The VU meter can be provided as volatile read-only controls, too.
> 
> So from the API-wise POV, it'll be a most straightforward
> implementation.

As a side note, the design of software interface for recent hardware
requires floating point values for this kind of data, while it is not
supported in ALSA control core and its userspace interface.

> OTOH, if you need more efficiency (e.g. the control access is way too
> much overhead), it can be implemented freely via a hwdep device and
> your own ioctls or mmaps, too.  But this is literally h/w dependent,
> and the API becomes too specific, no other way than using own tool, as
> a drawback.

[1] https://github.com/PhilippeBekaert/snd-hdspe/issues/13


Regards

Takashi Sakamoto
