Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86C4078FF
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 21:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235857; cv=pass; b=Ftz1KpLZ7JmbfKUg+llIpe7FUfru0TV1eFux+CxaEPF699D5+lhZbB4Lu4bBJX+d7VK1QtuKEOmA7hFpyzEE4DJWlPYRVw/D51HeaDwvABKO7zNNofDEvbGcUJlLb2N6x+KYoTSzMFOW4ho4LqAqXvqz9HtmjSbaIE+fcqWpBlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235857; c=relaxed/simple;
	bh=c4hXQCCxLDtyGLlGUA454CFpDJU56UZDBng+8kvLarQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjvv1G8OBAxFFnmOw/Rc8+/44aMIeB6ISvHRt/wa5t55aWeET3zpOL+wKjpcwQByOnhBMoNShKfGFfifo9+vHNrlFcFanp4xFuLBh0Fv22j6rec7pubbkJjPtshQ4fVc7+JUH/EGf2VlUJPUbVFgXjDuPtY+WiqM7jbpbbKT3fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boULtnwa; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boULtnwa"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso1152699eec.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 14:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791235855; cv=none;
        d=google.com; s=arc-20260327;
        b=QrmDk//HNtDSvyCtFpi/EPJnGqhSei/caG9YntXe3aZxToHvsG/NvU5oheLhcvU56b
         kVA7Hn+Bpp6FUOqRQGg/Us/WbQGXilOjplwAprORpHoy9eElBy/6hVQ7bqBOOpKCFMYW
         ja8/VBXCJjO4IFfg6dgkufWpM0XPGPcO2Kq25/BzqhtXWSQWr5HsdNGBxirIwyeMJK9S
         ISeey8c74hDzdIK5eFPAQW1DWqkRt7yVisLUimcdF8f/BnQPk1vX1ie8oBOUb5pj9dsS
         T1shqK9h0otwnUbNzB4oTDbB9lqxVR4xoYsOlzZVyzvK2ntjuFOTb3wjrztwokeR1Aay
         rX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XQ6Ky/41c/XeiIPfAh0He9jhHMd4++RTDtEOTbvUwV0=;
        fh=lnh4X27p4YPG5s5Jj7WBY2pC0abIKF8cWz2r6oHLLcI=;
        b=RxHr22AqDaragL2wD6bnc6UcQDLaFSu3gypMa94m7h/wJGAXwEPZhWih6zUlJ/PDAG
         C8YLr19lo8SIUQGlK9721KaAu9W/jStlR2wJqlfO63b58+Nx/14TdD2dCi2tpmmc3Dz9
         uTO86E1n2QL73GR89sBsCmwUflax2KBMq+0auPzKEErniOzhZgc0TZvCxKQ6qjg6YT9d
         RZqjx5ktT7vSY241LUsNrzYDoHEAB4yryRWjA/pR/W224HoKmUGq+jMp9Pe+0a0tymjV
         r5hWVHtYyLf51lqUDy2zw4GAnqMkfUOWr9FuKY1nFlzEZ8UvFq+KAJ+fX1y8gn48VqXR
         OJPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791235855; x=1791840655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQ6Ky/41c/XeiIPfAh0He9jhHMd4++RTDtEOTbvUwV0=;
        b=boULtnwa1FSYtXnOKUb1muX+ZNf1SgziqQfO3uXufxlnzZ3/slC/21F+UJ1aq2V6/X
         SXtRWPU9ZuSr96cjA2L6uRAOlhU6joogOERPKp8gd2HDnWdy8aykgfdVitVvf00ZmkZa
         0SGZAnSwFMJSZLqsC+JCq7B+Qj8cdFKZWEISgL7E9DPgWmFlsHwlZO3J8uc+kdYRqZTq
         j/2K8e1Ty1EUB0CLMTqxfb0hImwGqcC+oRXZbOiF+NJDPJ4tsc39tod+oXOYzM4tYLv4
         yhmVvp7Rz6mrVZ2JlEY9epWyRrWNwZphAUENnEHdo7R/dkIw4ONMr72rmlRKcTf3cT5M
         2Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235855; x=1791840655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQ6Ky/41c/XeiIPfAh0He9jhHMd4++RTDtEOTbvUwV0=;
        b=yTVg4AE0Z7FL6BDR2B7ho3H7DPiVZCcdCENVmVZyt5KdEllzn2ws/Wu1ZhVsdky/E7
         kmI8mUoAWHUXgCw8pxn0SflLSe7nSNzQaVh/BFFZs/8ciooQJ4cYfQeXo+beqmF7I0Sc
         pKOo2HZVpG+OrQkYwfiyEYHr+qt3zY+FWjrOI7xFdZ1ZGewl45aQzM0xeqt2kNSZP/QA
         LVOZTSTbzza6fGYCtA3ETj/lyYRhoAjEbUdC7o/lBbDYRPCKMoUeIY3ZjJ8jVi3unBVr
         rt38BofAN1O0f6jLbbxy7VSR6M93Fs74SJaIXU0VENbODJrBc0Y0bLPw2nCeuBBTT/ei
         3MVw==
X-Forwarded-Encrypted: i=1; AKwUvBxN3/Fei2RBZ4Y5RIE8TNJ46jSvj3p/IPx9RuOMB9WAG4E/nnr4KckxMw8Mi1Cs8JiOFojjJ3kOC/dDzA==@vger.kernel.org
X-Gm-Message-State: AFuF++ngpzYa7XDsyafDqUWi0qAqb32tCEO+ulN5RIdWlvvGj/dInBsc
	cTLddBnZb+a3pd+63+rBQ8AZTryZLqihKNDxTn/NTN0Pjw60UIDc8Bn/8rMUOwxGFsoLFY+x+4s
	suSuePwMFZLsDCqckz/DLyyuMT8WU5SSqfAFS
X-Gm-Gg: AYBFou0zUtgCj/8fpxjaXN7e/5kgMd5m7x+8fD0RviHK2Gigqh2/SXYY221CqnR7BQf
	wOQyODxLumO9NdIUet06U6xOIXA0TPTNMPqM1s2aB4RJQ4NalsMkFu1HvqvTraWAluU6RQx9OXV
	8/MgIpoG1JdzJaYKrtxEtI+OhNRR9kgoVCPh+LeOgVnBCjW0b36CCWdbUsxp1PCXIabAqHAa5M1
	iTtT2kDwJE52EzlGm3h6ramsO5SfiqGs2K7Xxq/PeoEof8fSXCXxIaUpe0M/PGB0A9m6w3QJbC6
	1ygBXTVrWPKnKEig64+SmxI1mj8OuyXmskfJQDfuaISfX4o3aEW1i+8=
X-Received: by 2002:a05:7301:18aa:b0:34e:f911:1763 with SMTP id
 5a478bee46e88-35145185209mr794738eec.13.1791235855339; Mon, 05 Oct 2026
 14:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmy3_zQ1VNUJJ9H1kkvHxf50Pg9AQ4H1rXZbyz6-zxJxcYowg@mail.gmail.com>
 <33d869bc-ec8a-4d9e-8ba4-350bddce7ccf@linux.dev> <asOVTdEvVmbQ78fB@sirena.co.uk>
In-Reply-To: <asOVTdEvVmbQ78fB@sirena.co.uk>
From: =?UTF-8?Q?David_M=C3=A1rquez?= <davidmarquezfernandez@gmail.com>
Date: Mon, 5 Oct 2026 22:30:43 +0100
X-Gm-Features: AclHuK-ITZ8iOF7GhEuphdUiorVGWMBsM3IK6S5UPuwA4ktGU8TxkV5HOSep1WM
Message-ID: <CAFmy3_xCeAE+H93xf0wKnrhwLdqCA7Fdxrgtunom7JUqhh3vLw@mail.gmail.com>
Subject: Re: [BUG] ASoC: Intel: sof_es8336: speaker amp GPIO stays off after
 stream stop/restart (no sound until "Speaker Switch" is toggled)
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, kai.vehmanen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierre-Louis, Mark,

Thanks for the quick feedback.

> Does this happen if the time between stop and restart is greater than
> 3s, or only when the delta is really short?

I don't have systematic timing data yet, so I can't say for sure. What I
have so far:

- It still happened once with pmdown_time set to 0 on the codec and BE
  links (I caught the speakers-enable GPIO low after a dropout in that
  configuration). With pmdown_time at 0, DAPM powers down immediately on
  close, so a missing power-up after a quick restart should not be
  possible there. That makes me think the short-gap case is not the only
  path.
- My suspicion is a STOP/PAUSE_PUSH on a PCM that stays open (for example
  xrun recovery, or drop+prepare on the same open stream). DAPM only
  powers down on hw_free/close (after pmdown_time), so no power cycle
  would happen regardless of the gap, while the trigger has already
  switched the GPIO off. I have not verified this yet.

I am now collecting a trace with kprobes on sof_8336_trigger() and
sof_es8316_speaker_power_event(), plus the gpio_value and DAPM widget
power events, and I will correlate it with the moments where my
workaround finds the GPIO low on resume. I will report the sequence and
the time gaps.

> alternatively you could deal with power management only in
> sof_es8316_speaker_power_event(), and completely remove the transitions
> on trigger start/stop/pause.

Agreed, that looks cleaner than adding work to the trigger path. I will
test that variant on my machine (and listen for pops at stop and pause,
which I assume is why the trigger code exists) and report back.

https://github.com/thesofproject/linux/issues/5967

Thanks,
David Marquez


El lun, 5 oct 2026 a las 13:17, Mark Brown (<broonie@kernel.org>) escribi=
=C3=B3:
>
> On Mon, Oct 05, 2026 at 01:22:10PM +0200, Pierre-Louis Bossart wrote:
>
> > Does this happen if the time between stop and restart is greater than
> > 3s, or only when the delta is really short? In the latter case, IIRC
> > there's a DAPM feature where the power down happens with a delay, to
> > avoid unnecessary power transitions. so if the new stream starts
> > immediately, then the power-up transition will never happen.
>
> Yeah, the default timer is 5 seconds.
