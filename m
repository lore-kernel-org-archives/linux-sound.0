Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3028D40F741;
	Wed, 22 Jul 2026 23:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784761385; cv=none; b=R3Wh7RSD4CudQGCFud92IppS867PonhdZgzOln38Bqac4ov5xDRGvz7PVA6ELKT3VHqgAIfh1mSjhiQYNyF5SbChw7I+lA1jwjHA/4kEOg0NY+V9jrRyin4BOWoNIJXiwNDWESaZ6u7N1ChxF+YaHSk/2iyovn5aXyix/pBu60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784761385; c=relaxed/simple;
	bh=I0lD8Krnxju0VuDaZYHw7a4wOTrD+u4wuHb+FslOiE8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hjZ+yOwjHK7ulN9YOt5GvHf5qiohDIt5q2SeuRMIbRH1EXULo0PVl+0PAOSu6DEUUGazMs3UMFTD9S8+z6EOEeiGWIyltOqZLk5l2mg3OeoeYIhCBb2Umq2pQ7zklNx1DlKcPwdUqKK5LKggox7S8apS5OWSqx1ZqezLxSYO6FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLeIms7A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLeIms7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415C31F000E9;
	Wed, 22 Jul 2026 23:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784761383;
	bh=0Tl+qoI9PancAMVme/+cX9/qhyBd/yDCaAgKynsuWHw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=HLeIms7AM2Tr+pmXbQpdPxnW2mNJQ1WWbDe+/ZNcdfvgSvCaJQT18c+UiBUXGeSMu
	 m+GskAqSDMNr40Wk2dfA3VnxG0t3h3vjWFhLZsOVwmbmy81cjZhwkiVhkfpw+TlND1
	 TaHNYqFCcRtYkqIol6JKG7hVhEOvIC6ygTq1pccjpL4tqfRci8CK2YWrerpLm8jRwE
	 xjEwMQcNIe1KRVRBrFVkYKQWfM8J41ePaDvbuAJQT0MFoy+CctNusQmDADk5tFN7Cv
	 pT/TRjtKXlxE2O4tOPZQjl8ChKmFBZ+0jwjBOPPB6OTNRznqeydVw2A+2aMuh+6/qL
	 5b9kWHBNmm3gg==
Message-ID: <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org>
Date: Thu, 23 Jul 2026 00:02:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Val Packett <val@packett.cool>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
 <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
 <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
 <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
 <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
 <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com>
 <20260715211919.49462-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
In-Reply-To: <20260715211919.49462-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/15/26 10:19 PM, Jorijn van der Graaf wrote:
> 
>> This week, I will try to pull some wires out and check that on my
>> hardware too.
> That comparison should tell us which side to look at. If your board
> does drive the bit clock from the vote alone, I am happy to dig on
sorry for the delay,
I see same results as yours on my VENTUNO Q board too.

As per DSP team it should work, let me dig bit more and see if I can
find what it takes to enable it.

--srini

> the milos side; any pointer on what to check next would be welcome.


