Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782757;
	b=5M//ONHAYgfKVPDZouNSJSN5T84KCFCKQQw9xppjlvyW5H6/Xsd0GCTulB3FyFRfCOL4
	 dA0vOq2jqjuO/PppMynuvCkysoC/17V/kQmHNt3WoKlnjbisOtJaElHQa1BGTU4lUMk99
	 jxAtLjlefwlsomu6KNu5B1SCGBHZIy6E8XHwxUXSygKf5V0E+Ai26MlfkMqB2AA9m92EH
	 AWPd7h99uKCiYgzTemzmpYDyqPEurhrAinwQ1zAMa857bspyqUSkRWqPsfXZ2RS+l4hKj
	 FNws4QpqZqycXKDPp4IvEY1YrNEpVqp5SBe7Ga/CdnIy6yNOQWAFPODQ1WkrXCjM5Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782757;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=PDLtNAeuvy14V/+LXyKVJqTpGOel+uo7Z7Ve4WH5+Iw=;
	b=vRXfVD8nmWojL4NSXrGrFdLwu29C+P8WmNXbKOG+qhur3RrEbxibYJgsjYJZVU9HhW6G
	 mC1SIYjuzaCo5JNMkUi0BW0SIVfdGm7NL93OxsassbF22Du5Ghq3XScfFgR2WBux/y+U1
	 0pCV6P/zQ0MY4mnNgOytqtZPP6ZgPssVEm4/WmBvphzdWt7B3pD9xhDfV0mOV3crJtpOc
	 CfsdsBnD3tffKxGowY8+ZFKoFVVyB1m1DUw396Uev5kDTta6z3eFdVthnybhdYN+ewxcs
	 ya8J0LIZ8G0K7XSFsOilwmJ8svWxBdR3btmhjGyAWAq5wkyWXC92aCZoB7UTTfRyiNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA37F606A333
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 08:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA37F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3sb6q255wjhffg5rxdcfm2t4fu.protonmail2; t=1793782753;
	x=1794041953; bh=PDLtNAeuvy14V/+LXyKVJqTpGOel+uo7Z7Ve4WH5+Iw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PIfDX+C7wcYmaHSGFHcE5dMEelODbiYVkhY1xD85AaX5gBxQAA0aRpTBdybyvCvME
	 4rWDFPAzwSkLvWAYNz10tW6+xPfba7i71s05DuRM3b4oLDpcKFEaWojtgFz4DPAdjS
	 ryfCEJChxS5Qabef4hNXiGyiPbu7OYwGtYHyyeBkHm0yhzUfiuGJleJAoeeZxAURRp
	 mDAiVeDXgNL0Fz2tPM3uMdY+eGo4pbMCoxru5JEc7KljT46OwqNLMJpXAY9MKSdXiq
	 rwYBhyTqY8+X25KwB8KWqEOS/aX2gUTsMfsCDEgiTmwurDyzeUkqq2s44lTVt256fc
	 IBOIJQKm15MrA==
Date: Wed, 04 Nov 2026 08:59:09 +0000
To: Takashi Iwai <tiwai@suse.de>
From: =?utf-8?Q?Juan_M=2E_M=C3=A9ndez_Rey?= <juan.mendezr@proton.me>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: snd-usb-audio: list_add corruption in snd_complete_urb, fatal panic in softirq (7.2.9)
Message-ID: <jxeuvDYjKOIms0gowTSJZYGmHyKgiV9gjNQbgF1sHiR5cRxc7kwC9gqemsnDDRO8OVASaUSplsIZ_OUE6NCLXxSiLBsfMbWeYmnDFVxvnJY=@proton.me>
In-Reply-To: <871p91w08y.wl-tiwai@suse.de>
References: <J1sr9AtFJ_J1bpxFaO0ivZEW9qZBdme6iMaAISltxABWM7FcdjLX9Svl18kcV1QM1jRFjzPqjdIr5wuC4VzPer3b-iHa05OovdSHx0isMlE=@proton.me> <871p91w08y.wl-tiwai@suse.de>
Feedback-ID: 176548819:user:proton
X-Pm-Message-ID: 9c097579ed7270bf4da0fbe253dec8e397246247
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

El mi=C3=A9rcoles, 4 de noviembre de 2026 a las 07:59, Takashi Iwai <tiwai@=
suse.de> escribi=C3=B3:


> This should have been already addressed in the upstream.
> Could you try 7.3 kernel, or cherry-pick the fix commit
> dbd9d1cbf970 ("ALSA: usb-audio: fix list_add double-add in
> push_back_to_ready_list")?
>=20

That matches what I see.=20

In Debian: 7.2.15 doesn't have it yet, so I'm moving to Debian's 7.3.1. I'v=
e only hit this once in 16 days and can't trigger it on demand, so I can't =
really confirm the fix. I'll report back if it shows up again on 7.3.

Thanks for the quick answer,

Juan
