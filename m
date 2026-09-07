Received: from mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BA9375F82
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 19:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811071; cv=none; b=RMxNrEJPVsBIorXzM1AsOd20S0ak8EdZoxZvICdcwzO2FTNWB8EAmeOp1Sb1QGn6vB2E7bes/FduLknFNcjCBJ754/8fxzMKF857vpcrofLoS2kwsuF8a0HUdaZLBIUjpFjmjYvJm/xBHeFB4PyOsYEAskB3s86hiu9mAAFeKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811071; c=relaxed/simple;
	bh=AVmntpqFMQUJQqOArS5677uNa0XgNRQqmgKDrKEtsFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKgxoehayZdBPjTgzf6WrUGL3vHJZHIO+v0MyKMwpNCBrJYjApBWWEVttxI1wHfgQTcGFjXjQd2UAoatqaavb4jhAhyinue2D3xB66DMXRcnw+0DkWq9K5LYrJJz2Ncex9BrGV0DMFPws8+0wm82vMtfc2Znir6gsfUF3WAvht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cdt+y96q; arc=none smtp.client-ip=91.218.175.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cdt+y96q"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AVmntpqFMQUJQqOArS5677uNa0XgNRQqmgKDrKEtsFw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788811067; v=1; x=1789415867;
 b=cdt+y96qrTuYSCsO+DhBOzPzyucCBkug4KOATZ6qKswetAzcRgu2NP8B7uZi5C5xnzRtz17N
 Z6pfBZfzaAYbxqmD+ccaKfAYwURMLGUh1ic4szchbTxCBtG/RUl3YP2MTC5JhzP6DSDJ4ETjB0r
 m2WRGNJmkl2ezmXL28/mE7GY=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66cbaa8f93b0f8a9;
	Mon, 07 Sep 2026 19:57:47 +0000
X-Mizu-Trace-ID: 66cbaa8f93b0f8a9
X-Migadu-Flow: FLOW_OUT
Message-ID: <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
Date: Mon, 7 Sep 2026 21:55:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@oss.qualcomm.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
 Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <ap7sF6dOY0Pl0c46@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/7/26 18:53, Vinod Koul wrote:
> On 07-09-26, 17:03, Péter Ujfalusi wrote:
>>
>>
>> On 07/09/2026 14:26, Pierre-Louis Bossart wrote:
>>>>> ...otherwise it'll end up with -EINVAL instead of getting passed
>>>>> through.  Also a switch statement would be a bit more idiomatic.
>>>>
>>>> OK, I will add the NEXT_TRACK and convert the if to switch.
>>>
>>> ICYMI for testing, NEXT_TRACK and PARTIAL_DRAIN are only enabled in the
>>> 'fcplay' application with the '-p 1' argument for gapless playback, not
>>> in the initial cplay application.
>>
>> With SOF/Intel/IPC4 we can only support DRAIN, NEXT_TRACK and
>> PARTIAL_DRAIN are not supported, but there were mismatch between fcplay
> 
> Those should be optional always. Gapless support should not be mandatory
well in practice it's a non-negotiable requirement from users... We had
to add this as the request of the Android team, and it's a standard
feature on most players, not a nice-to-have.

Note that the NEXT_TRACK only works if the two consecutive tracks have
the same format, if the platform wants 'perceived' gapless playback with
a x-fade then two devices are required.
