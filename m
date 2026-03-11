Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478912E88BD;
	Wed, 11 Mar 2026 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249456; cv=none; b=aAWa1QPdeatcE5DGtiOKejK+1cLXeYsyysINfWNrFvra7K9XqnfEhr87cL79HU8C9/dFl5V+q2qrS46h87rhyklm1S0cgsimiCqPQqUFLd+1zCdYWv0zzaSg8w+N93OOb+sHq0cwl53g0d8p1/kUtb96z1o9Yhns6t/I47B8r28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249456; c=relaxed/simple;
	bh=UUvN63OPETW9aV4zr7RY4tL7gyi91Vbrx++9YS5OYQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPr9JFRzYbwidqQYctCRdQAgeIz0jJYVBj81X5T9qt0Wo0h4UzUnJ2y5fd53FhkQFfbVThRq81Ga+P/tc3zlQC+AGWUKaFNLV7nIEcHxMq8AL81Ay7EYtORDLgpc/bfr5Lpr/tRQBxysdKvHHourWxQdVUOW2neMNFpTLhvQpQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=SllD61Kj; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="SllD61Kj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=Sg1JB08N987WmyH5xVrVXJzjj7rjWsv6sN1Lmszl1rA=; b=SllD61KjcA/ZZ49I
	v5+uqRExZjnXzmMX94EodT4sxauiRlh5MwSqDrl6Vt3h9XtqBa+kDtBS+tchLg8ZoZKB5mpKn233E
	5vKNTGcn56zbDhmVxd8UlLjQHd8bRlO3bmF5DE0T9ZcAg97F2y++Ev1XLeakf6STWTTozR6e2yn89
	MwePU2Kqhj+v6smAH+bgu6r7KpqPIhSz3O/bxFaPe4d0O6chz426dmR6XnfsFtpe/ljOgwNCcqsvh
	Ve7HNM0pkiFE0K5xRiXrYrtgFilQrDPtaXDxFz9jUQIrGdWaR/VvrGI3hSrKo8gBwhMnDVnyZvzSD
	Nn0EIttWgbGCu2urRw==;
Received: from [63.135.74.212] (helo=[192.168.1.241])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w0NBb-008WOi-7M; Wed, 11 Mar 2026 17:17:31 +0000
Message-ID: <661af6a3-f5aa-42cf-bd20-6881ace426d1@codethink.co.uk>
Date: Wed, 11 Mar 2026 17:17:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-topology: fix __le32 conversion in printed
 values
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, iwai@suse.com
References: <20260310094948.62023-1-ben.dooks@codethink.co.uk>
 <e535797b-2a15-4996-90e4-33d13bf5d689@sirena.org.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <e535797b-2a15-4996-90e4-33d13bf5d689@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 11/03/2026 17:11, Mark Brown wrote:
> On Tue, Mar 10, 2026 at 09:49:48AM +0000, Ben Dooks wrote:
> 
>> @@ -225,7 +225,10 @@ static inline void soc_control_err(struct soc_tplg *tplg,
>>   {
>>   	dev_err(tplg->dev,
>>   		"ASoC: no complete control IO handler for %s type (g,p,i) %d:%d:%d at 0x%lx\n",
>> -		name, hdr->ops.get, hdr->ops.put, hdr->ops.info,
>> +		name,
>> +		le32_to_cpu(hdr->ops.get),
>> +		le32_to_cpu(hdr->ops.put),
>> +		le32_to_cpu(hdr->ops.info),
> 
> Shouldn't we also change the prints to %u given that le32_to_cpu() works
> with unsigned data (IIRC)?

Possibly. But given the data was already marked __le32 it was already
unsigned.

Do we want to go through changing these before committing this or
delay it to another patch?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
