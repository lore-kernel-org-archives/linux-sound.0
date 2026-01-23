Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3402B2D7;
	Fri, 23 Jan 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769183236; cv=none; b=mDUK7gg+FqhP8+V4D3bkAmNuWbwqFUXUx+ZWYPBwhbYdxs+x3AnsaSd9GDtHo1TKMNNhS/Zhtuu6JvC9FOA8bXv8g1ComQ4dCyrwNNy06KtKKXXVBU73m2CvZ6+5Cvv5k6WCX/0nEMOVvMFulefDfzFlV10dqyzDRI5nfNRjlQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769183236; c=relaxed/simple;
	bh=hzHy7gEj4igAyZPA5EZDC6F+Dkp3qp4geRO5DtJip3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXSDvn6z5k2NE7CecJpgGnoiVjg2DWB93nzbnEN2QM53+F+XSnedOya+ic7YszHyEiHvfEcpooiqvcfHobVWvVfvpQAxycv/hX7sPoDTWbR8C63Zy2olXDNiBgrq4VYoWFWeWf+xUvHzm6wqekl6nRperw7zbh5Xra0xGqCurdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=kbP8a5Ww; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="kbP8a5Ww"
Received: from [192.168.0.120] (unknown [61.8.159.50])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 128582FC0052;
	Fri, 23 Jan 2026 16:47:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1769183226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAnaMqxS+Ztsin5R/ZptE4rivfR+Oeo92Alm1kxvLLQ=;
	b=kbP8a5Ww6A+H0DT31fWx8NY0w6+HgzltbvN+OuuEFzlWJTEACtWfqtpnsL596g4mFU0idp
	FyN9unL8fP9m2wb2j5or8HZl78vtiHnGA/xvZKdV5Vy6Ocp9K5W/nYihZjwKHqd2jtk1/E
	EKC80YgshLBvn5dHpKmagPyCUa2rZ3s=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <1a659074-83dd-4bb3-9be7-d65d25457def@tuxedocomputers.com>
Date: Fri, 23 Jan 2026 16:47:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ALSA: hda/realtek: Fix headset mic for TongFang
 X6AR55xU
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260122171543.19958-2-wse@tuxedocomputers.com>
 <87fr7wftn5.wl-tiwai@suse.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <87fr7wftn5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 23.01.26 um 12:36 schrieb Takashi Iwai:
> On Thu, 22 Jan 2026 18:13:42 +0100,
> Werner Sembach wrote:
>> Sorry the last patch I sent didn't actually work. Here is a revert and
>> a new version. Luckily it was catched quickly.
>>
>> Tim Guttzeit (1):
>>    ALSA: hda/realtek: Really fix headset mic for TongFang  X6AR55xU
>>
>> Werner Sembach (1):
>>    Revert "ALSA: hda/realtek: Fix headset mic for TongFang  X6AR55xU"
> Could you rather fold into a single patch with a Fixes tag?
ok will do
> Or, at least, give more details in the revert patch.  It says only
> reverting, and it doesn't help understanding what's going on.
>
>
> thanks,
>
> Takashi
