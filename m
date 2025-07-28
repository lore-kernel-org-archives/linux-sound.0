Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BE1219311;
	Mon, 28 Jul 2025 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753699966; cv=none; b=hhnMMyLCHj67vno1ytyk2hvBvz8WSUUSDuyAE0Az5IywpSsunwxn7bBmCeuWFJArSyyvXaVrVDZdLd7DQ8otOul+v7EgTa2sA/u+rDrRTPLwmBQxnh7jy5V7LdAYnuvhckZtSC45KxG7XRoT5W/MtTu5w8sH7Twq8IRtJjRupEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753699966; c=relaxed/simple;
	bh=101L7ZMoSdx2x9v7q29U8ZPnWqt4303aTxdUTH++2CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG3ewQZ8f/gLhTBzE7x2d6bl4akvD1O4oxnqL7Kzb7+cV1KlbRuArOc/nNTBIsZWyzygakhCfgwJXe1uDu0WbRQVQ7Q4h8/7z2hYbOJqs4tiCq3Oxm54qzkP0v82u20hAFuwku2GeTnYlmExc2roM6ssXysGmiBGebb3itbF1Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VVhjyRtq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VVhjyRtq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104F6C4CEF6;
	Mon, 28 Jul 2025 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753699964;
	bh=101L7ZMoSdx2x9v7q29U8ZPnWqt4303aTxdUTH++2CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVhjyRtqTgbkzAUekyOkQGQFGUg5z16o5i12+pFbCbx/0LVPHsgx7W9aGOArJEi4Q
	 EPgmiUJ57BlnIvLqez78I5LfB1HN8YgxM8EqljDSiVO29l0BFtADF8NHb2MsoehUIk
	 tki5nf+NyxOdkQispBBGxM5nVLYnQqZDMmOjlGi8=
Date: Mon, 28 Jul 2025 12:52:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: Adjust pdm dmic gain using module
 parameter
Message-ID: <2025072809-spookily-grip-3c2f@gregkh>
References: <20250728094243.3824450-1-venkataprasad.potturu@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728094243.3824450-1-venkataprasad.potturu@amd.com>

On Mon, Jul 28, 2025 at 03:12:27PM +0530, Venkata Prasad Potturu wrote:
> Adjust pdm dimc gain value using module param.
> In case of regressions for any users that the new pdm_gain value is
> too high and for additional debugging, introduce a module parameter
> that would let them configure it.
> 
> This parameter should be removed in the future:
>  * If it's determined that the parameter is not needed, just hardcode
>    the correct value as before
>  * If users do end up using it to debug and report different values
>    we should introduce a config knob that can have policy set by ucm.

Note, you can not break a user/kernel api like this once you introduce
it, so be VERY careful (yet another reason for it to NOT be a module
parameter...)

