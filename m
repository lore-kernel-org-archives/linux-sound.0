Received: from out198-28.us.a.mail.aliyun.com (out198-28.us.a.mail.aliyun.com [47.90.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B6940DFC9;
	Sat, 28 Mar 2026 02:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774665685; cv=none; b=gHhmjMwYTkRj4kJw9vJ6mrPjw/69PIT7YmkTreA/jasSw06e6tG1ZhLmY8vKDlc4eVibaj479qKnAFiTxRL/RL2FqajPytuDVA5puIBIi1/t6+jNbEjS7vpwb12DJEhNltix3jlLFpZVVwTEckkPulICM9CNxcga1wwgPVZhoc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774665685; c=relaxed/simple;
	bh=RtxxLSB7C+60uly6r49OhLfUvwVWVP/7CFf7noKuEcA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IrdgESJv1XM1B5B2gGjr8Hl8Z8XHGhi0zoMyclbb74ZVLAXmNA8NA1tL3pnkr6s/jZRlS4mhBBDAycb1oHWEqq1Fa7GyGo0o+LL3XmcyZqvibS/0weeRARcFYIPOpZqO0FOb4/kjsnF4t7ywwfeJRudVfIEkE2HzSZ8EGeDA/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1279519|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0135417-0.000511735-0.985947;FP=15555341741850299667|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=fuhao@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h.n6FQA_1774665661;
Received: from 172.25.21.240(mailfrom:fuhao@open-hieco.net fp:SMTPD_---.h.n6FQA_1774665661 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 28 Mar 2026 10:41:02 +0800
Subject: Re: [PATCH 7/8] ALSA: hda: Fix single byte writing issue for Hygon
 family 18h model 5h
To: David Laight <david.laight.linux@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <cover.1774595153.git.fuhao@open-hieco.net>
 <b978ca224f7c9a3c30efd69abdac5df395da63fa.1774595153.git.fuhao@open-hieco.net>
 <20260327130226.1e239670@pumpkin>
From: Fu Hao <fuhao@open-hieco.net>
Message-ID: <3da88b65-d306-80c6-d003-c9fed67856ee@open-hieco.net>
Date: Sat, 28 Mar 2026 10:41:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260327130226.1e239670@pumpkin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2026/3/27 21:02, David Laight wrote:
> On Fri, 27 Mar 2026 16:11:13 +0800
> Fu Hao <fuhao@open-hieco.net> wrote:
> 
>> On Hygon family 18h model 5h controller, some registers such as
>> GCTL, SD_CTL and SD_CTL_3B should be accessed in dword, or the
>> writing will fail.
> 
> What's a 'dword' ?
> It is short for 'double word', a 64bit cpu has a word size of
> 64 bits, so a dword would be 128 bits.
> 
> On Hygon family 18h model 5h controller 32bit accesses must be
> used to access registers such as CTL, SD_CTL and SD_CTL_3B.
> 
> 	David
> 

Accessing in dword alignment means performing register read and write
operations in 32-bit increments. In the current driver, some HDA
registers are accessed by default in byte increments. However, for
certain registers of the Hygon HD-audio controller, such as CTL, SD_CTL,
and SD_CTL_3B, they need to be accessed in 32-bit increments during
initialization, in accordance with the 32-bit nature of the registers
themselves.

If you access it using dword, the API snd_hdac_stream_updatel(writel,
32bit) will be used.

-- 
Regards,
Fu Hao
