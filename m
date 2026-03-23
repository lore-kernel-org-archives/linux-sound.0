Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94023A382A;
	Mon, 23 Mar 2026 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269100; cv=none; b=i3Oj2AM35jh5VdBt3v9FDhjg2aYB+BqiaA97ogfaweWvNJ9307oyD9wtFj+Wd0mtvmEMWVl7JgG7ZPqaR5i+ROzxd6AakQkd0KBwkKT86I29Ws0iVroi7WqBJRU6mp6gy8hc0mPqUDI+TY6d8DaaUlHTmc0WEnIqcyVRgaGKRhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269100; c=relaxed/simple;
	bh=uEdu+WJlvhjbnyLoSD3Qcbnt0i8GCnxNmjYJuQsSy1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDfEjUClQEdc8l6mX9LTbtiDn01g8rXfmMpyjasYimvv3tFP5qEXLS+drE8F2MHJWDpMSS35dxrdFEqxAeudcedaoYUw6bbfZj75BhlHrk3Rg2V6KgFCBKNht3r2/7wo0K6o1dZXzsl71bQOvZ2WgP9BEPcLOuddzr7T5QKskoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=3wKHyXyY; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="3wKHyXyY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=awhDz9dy5gf9OoRyP8pcxAhanesC3hImbJulRQtyy8o=; b=3wKHyXyYFENMfLRN
	xtjrzEmvubtaPc319/pidjAByg6VLPoXMHvGxvAwWmyvxGFpmPCgvaipImrCsPtULfTXHvcw91TuQ
	Kzum1hWVXG7v0p6IdUZM/m7Tii5AajGTPQSLWPs2B0tM8+UokQpURMiWNmEhOdTQSu0MkTvGEi+Qq
	ycVPyx+tea3qysJqyPVU7t+MbM5jQ9CsjCTQe/CbXhAuhUZ5Kvl5y5Y/rH0OKmFl1MbgmR9nUteb3
	mgfaLga2JdSkvOW5iIoMlt0uwLxvsGnHT6+G6wWBIHYU2AZ3srMPlcMVw4PHb3dWbgIGugT+9YNRF
	j3p3VQi8DKn11p+/VQ==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w4eRQ-003qi0-9X; Mon, 23 Mar 2026 12:31:32 +0000
Message-ID: <bf59d766-d081-4548-b347-d2b40e1b2ba1@codethink.co.uk>
Date: Mon, 23 Mar 2026 12:31:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: soc-topology: fix __le32 conversion in printed
 values
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org
References: <20260318163427.1083470-1-ben.dooks@codethink.co.uk>
 <6c2114d1-cccc-4857-b3a4-3fdcb9932c76@sirena.org.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <6c2114d1-cccc-4857-b3a4-3fdcb9932c76@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 19/03/2026 13:58, Mark Brown wrote:
> On Wed, Mar 18, 2026 at 04:34:27PM +0000, Ben Dooks wrote:
> 
>> @@ -1957,9 +1962,9 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
>>   
>>   	if (soc_tplg_get_hdr_offset(tplg) + le32_to_cpu(hdr->payload_size) >= tplg->fw->size) {
>>   		dev_err(tplg->dev,
>> -			"ASoC: invalid header of type %d at offset %ld payload_size %d\n",
>> +			"ASoC: invalid header of type %u at offset %ld payload_size %d\n",
>>   			le32_to_cpu(hdr->type), soc_tplg_get_hdr_offset(tplg),
>> -			hdr->payload_size);
>> +			le32_to_cpu(hdr->payload_size));
>>   		return -EINVAL;
>>   	}
> 
> The format string for the type got converted but not that for the
> payload size, both of which got le32_to_cpu() conversions.

Thanks, since there's been no-other reviews shall I fix and re-send v3?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
