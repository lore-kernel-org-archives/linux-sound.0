Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF717A31E
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 00:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783212046; cv=none; b=h37VKggdmRYWE1UL5cOekVlwhunD6U3TiBGv7GXcDVE+BxclwglC+DXVyI9b4JkiGUZWBtAvm6QlLOvXelU5jf0Nr12lBTztNdWWzpwSDblmu0LgdwBdIC41PCVxtiBlbW125W/zjlT2CBzr1+8MqxBjyacXSaE3rDZLYGB26aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783212046; c=relaxed/simple;
	bh=DNU481lnqGHS63NzvJ+leqG0GqNAOKX9lvsSqVUooXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIZ3LyVdylNujWCDzhmh4lcJ8JzMvVlMKqBs+u+UcTRIFkbpMYO2/kiE8Sl8GStAuNE1Grz5unj2AOZeW9LtLXY5ppeCLPZWM0kWTgcSY0lj2Ii5Ah9lz0TAPcBwKVcRtsxhJV9Q5y1MYJ3khTQ7oS9ZlnbaGVrdMxTac7JbF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Yxwy/7/V; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Yxwy/7/V"
Message-ID: <d2318ba8-43f9-478b-8f9e-2c09d44ae0b1@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1783212041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3F5TqAEpezXvBsOsEx7vdvXp/ZG+xaYWD08RmSf9j7w=;
	b=Yxwy/7/VH0vGaebH0paWTWQd0QNBh76Mp7l1R/moOugKLAwsgkezvvlXHvNms4BPpDtvf0
	cBKmhW8HBNAP6VvfH4+Y1NzmbE11En85zR1/fn/WSD5UNdZb0ST/AuSInf/7yuCj7XGwAU
	QHz6ofe5zLohsB5fbcVzJuZHJHuNSh6N/3gOOSg7FvyQc/sgaZ86dpMn1Sn9vPTp+M3bZM
	iOhz98477mwRr85sTzxplT0Xp5iTywhSupNpPTgGHRp2x1kF2J3k+37ZxD3J2q5QdmC8hi
	F9GvF0Fos+8wAKBFbYk9KvJejv51dNvI1B5CG5XvP0XpBtldY9umy2rHKkopyA==
Date: Sat, 4 Jul 2026 21:40:24 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: support Senary MI2S
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260704192830.88134-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260704192830.88134-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 7/4/26 4:28 PM, Jorijn van der Graaf wrote:
> Extend the clock-provider DAI fmt setup to Senary MI2S; without it
> q6i2s_set_fmt() is never called, ws_src remains external and the DSP
> does not drive the I2S clocks.
>
> Force 32-bit slots on this interface in the BE fixup. The only Senary
> MI2S user so far is the Fairphone (Gen. 6), whose AW88261 speaker
> amplifiers derive their boost converter clock from BCLK and are
> configured by their firmware profile for 48 kHz x 32 bit x 2
> (3.072 MHz BCLK), matching the downstream configuration of this
> backend (bit_width 32). [..]

Since 
https://lore.kernel.org/all/178104655633.212106.619790244001573816.b4-ty@b4/ 
you no longer need to care about what the profile specifies. The aw88261 
driver properly participates in format negotiation now. The "firmware" 
register list binaries are therefore nearly irrelevant. Please don't add 
any more of this force-32-bit nonsense! We've just gotten rid of it on 
the Fairphone 5 and other kodiak devices.


Thanks,
~val

