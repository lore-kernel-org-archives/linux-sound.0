Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24ED4C96
	for <linux-sound@vger.kernel.org>; Mon, 26 Aug 2024 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724637955; cv=none; b=SG6sbspMGBse7dgEM6trC1aTc0Ljh8PY6SCbpW352VWIFQ4lQTMlulRyXryNMhqdhz6XSIlCLyqal++02ohM2cgfUouNnT3jSylX8kMFxTlxJAdvPHGYBI/ZY6NArp3bX97EoHFI53CrxNPMxhiv0m5KP7cqfaKlwvFZ8UF8h/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724637955; c=relaxed/simple;
	bh=SGyaOst1fIrKa6bTONMzVbZQiS7pe40EWx9ybroQtec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UBfPgT7GyNTuOI5pUbIphfGzpLyGR7cyM7Z1VN06ohLFrIwbbxIouEu2U54gJYV+Jks2GFhzQ6u/gEVhk449fV5o+bZejDpRDEHFp2P2BH4S4pjRhTGh3dpyfQlx1569pYUQGLEWU9WX/5nfjdmmFlzdje0knw3Yv9zwWUL0XDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WsYqy3jvhz1xwH4;
	Mon, 26 Aug 2024 10:03:42 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E5301A0188;
	Mon, 26 Aug 2024 10:05:39 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 10:05:38 +0800
Message-ID: <88a7f111-8b40-4c86-b638-500df46f80af@huawei.com>
Date: Mon, 26 Aug 2024 10:05:37 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: audio-graph-card2: Use helper function to
 simplify code
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
References: <20240822112649.58376-1-zhangzekun11@huawei.com>
 <20240822112649.58376-3-zhangzekun11@huawei.com>
 <87frqsqdr1.wl-kuninori.morimoto.gx@renesas.com>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <87frqsqdr1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500003.china.huawei.com (7.202.181.241)



在 2024/8/26 9:22, Kuninori Morimoto 写道:
> 
> Hi Zhang
> 
> Thank you for the patch
> 
>> -	do {
>> -		*port = of_get_next_child(ports, *port);
>> -		if (!*port)
>> +	for_each_child_of_node(ports, *port) {
>> +		if (of_node_name_eq(*port, "port")) {
>> +			ep  = port_to_endpoint(*port);
>> +			rep = of_graph_get_remote_endpoint(ep);
>>   			break;
>> -	} while (!of_node_name_eq(*port, "port"));
>> -
>> -	if (*port) {
>> -		ep  = port_to_endpoint(*port);
>> -		rep = of_graph_get_remote_endpoint(ep);
>> +		}
>>   	}
> 
> Original code calls (A) first, but this code calls (B) first in
> for_each_child_of_node(), it breaks logic
> 
> (A)	of_get_next_child(ports, *port);
> (B)	of_get_next_child(ports, NULL);
> 
> This function try to find next port, not for port loop.
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 

Hi, Kuninori

Thanks for your review. I have missed that logic broken, and it should 
not change like that.

Best regrads,
Zekun
