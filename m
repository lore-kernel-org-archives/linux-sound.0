Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456310;
	b=zGdmGDXPR2HCycmzINqksMpViXcxLqzpNxvbQcwEStTMzx6Y0cnMy/ghXKgJ8vaNv+L3
	 +4JFIwmgZH3xCODPmbXL7bnIg/ghIR7lSgAPqUkiUVJjOwm4SVK3lT30NLDSJdNNbQPqc
	 pbS1X3N9TVqpVO8d8QQKlDPcFsL3JFPJ1uSDRvnSXzPOPTF9vherW1ynWmZMYivyBdup3
	 BSjOlwoUOOkncCYJRcb/0CE2J8i6vXf98lpogG9PwF00DKPFR4omcVJpuo3zxPnaNxGVE
	 pzvyMaJauzrVgMJcbcvxsDBUtzh9ZRgsWl7OvLyzSrGK0AyHroL8YVC2Cm+TBIjS7Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456310;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gJ5RfwZZPX7Y2W4zWREPxO/nL6Fo9XoQIT2kKkja0ck=;
	b=1BiYgqMH/e7MBkUXm1kUihz8J0caCDHLKZpJZffGNhgGNVavHXpgllqfuBDkZASAzkut
	 lLZgpxzKR0JY9q9rdjZc6cMAz0lN9WUpG65oQF7sx9/gsfGSfCQQ/BEBR5Tp2+zCTRmdm
	 pwoqLF8mx9fyNMvXXuWd0WU1LpD2Wv/J8z/S5l9vGyJWKLfK2ZhFQjWf1oGUdae2r4H9b
	 qxHPJ7dJpzN3aEjko6Nt3zyOZy9jyk7yJFwMCGbXbZU5L3zWvdeyujQN7wRbqaFzC2FpV
	 DPwu6sLp1lT9IB9dfbou3kGTiXMDYJzG8qzk5hsswckiEuILbvbdT0B4Ga2XrUc44QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=YsB4N4Mj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fuyo3Jxs;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFAB606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCFAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=YsB4N4Mj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fuyo3Jxs
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id D3AD21D005AA
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 12:51:48 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-02.internal (MEProxy); Mon, 23 Nov 2026 12:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795456308;
	 x=1795542708; bh=gJ5RfwZZPX7Y2W4zWREPxO/nL6Fo9XoQIT2kKkja0ck=; b=
	YsB4N4MjcUBwCbJ4pBDcwxOXQ7g2lReKra62eLF4YI7kyg6x4eE5KiTD9Z8Ovc3L
	EscQB8yCIjyWgIMlfqNAnDYcia4Knvd31u2FbGCblu7tq2TpPReQn5xltOFdskXh
	UlA3j+XdLdyEhKHdEbObGVdhF9hmkDkzvnA+j6G7PBgxQu4iWlL0Rf5o20Jd8x5B
	pH3dxG11CianosgUvsNg8GNWjmodTEyew3CZ7PmFEkRspyUykePY2nGQTTTsxN/E
	6B7EafnTmj+r5ZVJJt06iEZLBgj7Ai2N6XHZtR8Lcla65ObAM9z7cpVEG158x+HR
	kAgJGxE7FRewtGmXr2DGtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795456308; x=
	1795542708; bh=gJ5RfwZZPX7Y2W4zWREPxO/nL6Fo9XoQIT2kKkja0ck=; b=f
	uyo3Jxs636EzfNHz7W1WTB5m6FVafFLi8k2RG5dfKSRaxq5PqYlcG5Z9P+1UWm54
	U57KSyBN5xh+TfIOn9Hk1WqqHwVnYhxZWv515APBpdTgQIX2DYcjAkpPIGrN88N2
	b271m4WudnD1jmelFD9PcnvfQY6RouVPvSHM4QOr4SkXd13MAySZYyNOmIfMA92k
	52CWZRDt6T6BfsBSOdqPdAqWaQAHV0AMw8uCRDY++88dVC8ningEBOMAHbdGioVa
	bHK88vCG2j+qsVAzugHc6MisSmb5h+Go88icPUqbDqLFIc0YIh6A9X2Ux/nFA+eh
	LwNpiqzMMpAD6Sqi3SKwQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795456308; d=pobox.com;
	mf=PG1sb3JkQHBvYm94LmNvbT4=;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:Pmj3SBKTkSlYKKXEFQjVqYImRGXXmoSUh20+oWYKYIGaXfG
	xgr95T5AhhBIf4uvkObQIkRQ8X7OigCITNXGSEdyzGbB81Hsq0daLe+EZRshiNgy
	PmOBRc1VGXRIBC76hAYJ2ImLsrr1TVO5Atbi8ncCTMfCr4DRVKB8c97ZNTqc2k1z
	FP+x178Y4uwmYiN3Dt+X4TM+W7aJkFAtu+7WcatY/tsiHNbCl6kFG9FD7FJWjMvY
	lcvfrUjf7RYELvDdYfVTsI1MTMh9vsOdMq8kJNLnLqy0XAGEzMQJ9gK3dQnqV5li
	/AR53Xq8bRrTqcFYB2BlgV7iMsORPrtcWEXvrXg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:rWsUXCq5tPsN71nOlpdvX9Hx5tS9YkVL7iaBpRKs0I8=:/EarFVdP4G9bZnRuobHyqqQeIdIWG6P0ZOyhnh0NEm8=;
X-ME-Sender: <xms:NH0EawcQWpZ4l4uwOE2bX-AlwQI0Z0KermdyYiBh8AQ4JtO0jihloQ>
    <xme:NH0Ea5oUBXlElxiqmMVt7rfnFWzNTA92c9SCTiZnHpLjHo34f9VMrtKM0BVRQ25dB
    uW6pwyskJPmqntd3fv1KwcqiZSy89eU12iLy519hKOefIXz7DxxOi2Vpg>
X-ME-Received: <xmr:NH0Ea-4pItZA-UlkqMC_7bpz2gwQl3fxrsIbGM5oacIBAz_dSksMBWBUnPI>
X-ME-Proxy-Cause: dmFkZTECeqZ+mOx4/73GIHVCFgGWr1qEFtx3o7ajU78s6D52BBwVSB4n0JQyfHVPpLhYS/
    zFCzAT5nPU3P2bvfTtzlCYP3Wqq7k6aUGch7ktogKT5Cbi8pR/gv882ibcVjEIt2mZYWor
    zpJcox8aF/BrNBOD/ttTca951So875f1gI1Z/DFXnBwqe2yQxj5puizbGarQrBfj/QjU5I
    Aom4vVyy8x7QA7o7i9PGXCuLu55TkQKWuUzSB1AkjHM65cm18HJg0yzZT4Ljnl55OqYz9d
    NoiG0qoWPZQ5ZUIMKVGGE0j71uKqACS2No+z5aIis9g3iFxYNteNapC7X8xgnAQSNkm+eO
    keYMCynyXXcsYDyyBjuU40ITuQv8RclXBpFHgLSJL2REMDmN2Jh708XDuWH34Rm+TKpNIf
    6TQKLNJwlGLySX06h3ESTfb6BWu6k0RXLlVWwAGlsCKoDIsTeSFm5z2I7O3eD3yMU+1XSb
    oGDgjcD975zGpeDK30mf2QAzoUlI+qYTCgHp06rCp3KEfMKjb7sMPXO6O5wNi2Y/usNzEg
    3FBRLlZ68zh2KLaACIE/GxAGa4lS2IGg+zuiANUHEszgmVnvBVxI75/wCso0g8DbhizYNc
    CU6qq7UsVhBiA9QRDuhFfU/tg62P/FkboGJZSH/P6lihN/kPiRiO9BqvWcPw
X-ME-Proxy: <xmx:NH0Ea_oxatKY1bVEUOtJz4IMSGuhsGESdeKAq_3xTHlJCvDpw_tAig>
    <xmx:NH0Eawhf90gqt4ywyBTxPE4JsrqyFNcxFWv5IyZSvnpb1A4V1W0wpg>
    <xmx:NH0Ea5InpuakxFehHCSPaOz34uKfnFzCEJRVnowQGZD0jIhgzXGi5Q>
    <xmx:NH0EawAPtwBOrM7EX74PFiU58viCaF2-nNnK9zd1NCjB3vB3mh1YwQ>
    <xmx:NH0Ea1rDxvO4ta-eT113MSEyu5UI_J3z8zOsaD4qoLlu9J5CVko0uZFv>
Feedback-ID: i55d94976:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 12:51:47 -0500 (EST)
Message-ID: <64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com>
Date: Mon, 23 Nov 2026 12:51:47 -0500
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: Cen Zhang <zzzccc427@gmail.com>, linux-sound@vger.kernel.org
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
 <b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
 <c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
 <87ik1ndgkp.wl-tiwai@suse.de>
 <0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
 <874id7d336.wl-tiwai@suse.de>
Content-Language: en-US
From: Mark Lord <mlord@pobox.com>
In-Reply-To: <874id7d336.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-23 09:39, Takashi Iwai wrote:
>
> Are *all* devices including both HD-audio and USB-audio gone in the
> broken state?  You should look deeper and compare in more details
> between working and non-working cases.


I am using the Kubuntu Desktop, and the Sound Settings in the GUI
show no devices whatsoever when it fails,
and many devices when it works normally.

That includes each of these:

HDMI/DisplayPort 1 Output (Meteor Lake-P HD Audio Controller
Speaker (Meteor Lake-P HD Audio Controller Speaker + Headphones
Digital Output (S/PDIF)(USB PnP Audio Device Digital Stereo
Headphones Stereo Microphone (Meteor Lake-P HD Audio Controller
Digital Microphone (Meteor Lake-P HD Audio Controller

Since none of those appear with the culprit patch in place,
to me this suggest something is locking out the rest of the probing.

There's probably a better place to look for more clues,
and I await instructions.

Cheers
-- 
Mark Lord
mlord@pobox.com

