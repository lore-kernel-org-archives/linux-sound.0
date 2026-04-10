Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421DA33263B;
	Fri, 10 Apr 2026 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806897; cv=none; b=OOO0hqW2FZr2KGdDjnlO9A3GfJs+y5LtgcYEwMIizPiFqRXabAwoP+IemBY+MRGcRmFIi2bRWsgAPRibbPCeJjqEimD7Nofh804J+87ftK3TYlXxX2A8wqfT+9KxDJQ/5L66fJx0bFjqkNEYcQKh0qyu3PjsW6Dwa1sS3CbVFLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806897; c=relaxed/simple;
	bh=KuVIVsxb6yx+GwudeXmJHxrdPECDjhKJa25ATPJtoto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZB6dEUjWDa0ejTo+ArVcQD/ZJXOn8jCKzK2yvBEm03yQp5ldDYSIrXwV6Cn8r1pRzyK0IXNMVLLuXbW8nNQW+PChgC0VcyMMNqRmiIhpFoEVT11d9RU9mLm4ojH80ExwEVIHHrAxV+D/NTXoW/qJDoYiSHC8K4CeRdCWJ8uuG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iR2Wb1SI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iR2Wb1SI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76252C19424;
	Fri, 10 Apr 2026 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775806897;
	bh=KuVIVsxb6yx+GwudeXmJHxrdPECDjhKJa25ATPJtoto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iR2Wb1SIHE9R3eKZxuna3VLzwEYoKAlVgEhLU7Lie8Zjsv8g42RNwXrt0gotmz/VV
	 3kT3KpHicamcDx10RZHhz4o0xpqIg4/KwsttcoRw6leyW4wlskPcOw55aTW0DV44cM
	 Fuf5ld5jrGPx6VP2GM1NSgf10BM7iULptAomHTzFgmkjFCAGUf+k0JOlTl1Gw5Eq5O
	 A5Duv1YsZF7uzmxprYiDm1tGkYJIYpw5Qp4DSyi+WOhpkiezvm79rffbUanoTx+VQA
	 zxHKT5ca9FI+Ci4FDgRmwfPrFXQ1TXTSzIx4f3oKP2+ANJVuqRo/34QkdtbGQVplTG
	 wwP4KZ6s8Yvtw==
Message-ID: <76ff00e6-07a3-4c0b-8906-baa13c077468@kernel.org>
Date: Fri, 10 Apr 2026 09:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: fix code style (ERROR: else should
 follow close brace '}')
To: Takashi Iwai <tiwai@suse.de>
Cc: Lei Huang <huanglei814@163.com>, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lei Huang <huanglei@kylinos.cn>
References: <20260331075405.78148-1-huanglei814@163.com>
 <87wlyss93y.wl-tiwai@suse.de>
 <460e5a49-dd85-41fe-9d35-0c4e7efc0ceb@kernel.org>
 <2475f220-b0ff-4ee6-b897-75de87d68f81@kernel.org>
 <87mrzbgtln.wl-tiwai@suse.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <87mrzbgtln.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2026 09:30, Takashi Iwai wrote:
> On Fri, 10 Apr 2026 09:11:39 +0200,
> Krzysztof Kozlowski wrote:
>>
>> On 01/04/2026 12:43, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 10:20, Takashi Iwai wrote:
>>>> On Tue, 31 Mar 2026 09:54:05 +0200,
>>>> Lei Huang wrote:
>>>>>
>>>>> From: Lei Huang <huanglei@kylinos.cn>
>>>>>
>>>>> Fix checkpatch code style errors:
>>>>>
>>>>>   ERROR: else should follow close brace '}'
>>>>>   #2300: FILE: sound/hda/codecs/realtek/alc269.c:2300:
>>>>>   +       }
>>>>>   +       else
>>>>>
>>>>> Fixes: 31278997add6 ("ALSA: hda/realtek - Add headset quirk for Dell DT")
>>>>> Signed-off-by: Lei Huang <huanglei@kylinos.cn>
>>>>
>>>> Thanks, applied to for-next branch.
>>>
>>> I hope you dropped the fake Fixes tag. Or at least give people chance to
>>> review it.
>>
>> I see you entirely ignored all the comments about fake bug being fixed here.
> 
> I saw your comments, but I have a different opinion.
> In the case of HD-audio code where the code change happens very
> actively and quite often backported to stable trees, a change like
> this would block the further backports if missing.  With a hint of

No, it would not. Commits marked for backports can even mention
dependencies.

> Fixes tag, the change of the code change can be tracked more easily,
> hence it's still worth to have.

Fake fixes tag is not the solution for that. It adds effort on stable
team for no gain, it adds work on people evaluating backported commits
for no gain.

BTW, since I was looking at your tree - you have contributions from
songxiebing@kylinos.cn which does not follow requirements for a *known
identity*. IOW, it does not pass DCO requirements and should not be
accepted.

Best regards,
Krzysztof
