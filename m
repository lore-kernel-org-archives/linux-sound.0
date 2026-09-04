Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF739476078
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 13:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529640; cv=none; b=KH/3glVSKMTbD3dI3MkWPh931IVLYkJeUiwqpB2jM6BiMGF2dlqJb4Hv+uLBP8UO7JiPjeswWGY7XfAendRzO92FS3HNUYtqZ226+Feq1pWQjUwbWlunCoTxg6/H8kNdt2iZgtRxSeGp77LmV2U5+qaqqS+w8JLnW0QV9L+karA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529640; c=relaxed/simple;
	bh=xXl2ZkQlJZ8UUkG5j4BEBzSJWv51ka+CTLQ5nSj7uII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1n32+YjOwRJL5XHIcjws4ZihjKLvmgvMY4MIDEvmNEx5mrs68tzZIppSXuy7ZM0aWxJ6dJ9trv1bVyFsciH9ey5hvM3uywRL1IkqrU+FqXys1dhhqyra1SZK5aC/VxVJ0P5QDlwMJqQTTMMErJQfjWVbTyPtvYaZE/xtZOH1dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fgqvd6Je; arc=none smtp.client-ip=91.218.175.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fgqvd6Je"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xXl2ZkQlJZ8UUkG5j4BEBzSJWv51ka+CTLQ5nSj7uII=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788529636; v=1; x=1789134436;
 b=Fgqvd6JeKpPwu+pSgUvR3is+igKTcwC3LPsoAFw5dPVPOdh1SZHm3kp8tZ63/Sr2/lxcHbQe
 eZv2cYGf1JfliXhqC+GViMW7Pn6+QO2RTKZOgXrlxjtNzYEBbIfOfdeMri0JbdllDJCj9yK7vfq
 uXpY+iczyJigaA/BmORxpTZw=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 78a18ed90be11df6;
	Fri, 04 Sep 2026 13:47:16 +0000
X-Mizu-Trace-ID: 78a18ed90be11df6
X-Migadu-Flow: FLOW_OUT
Message-ID: <9f06bdbc-b25d-4a8f-aeb6-ba11e43e9cdb@linux.dev>
Date: Fri, 4 Sep 2026 15:47:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: debugfs: add root-level peripherals table
To: "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
References: <20260902081802.420946-1-yung-chuan.liao@linux.intel.com>
 <6aa4b17e-042e-4319-a3a2-41f7346f3755@linux.dev>
 <SJ2PR11MB8424EEF8CC938A4DD842F06EFFB52@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <SJ2PR11MB8424EEF8CC938A4DD842F06EFFB52@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 13:36, Liao, Bard wrote:
> 
> 
>> -----Original Message-----
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
>> Sent: Friday, September 4, 2026 3:35 PM
>> To: Bard Liao <yung-chuan.liao@linux.intel.com>; linux-
>> sound@vger.kernel.org; vkoul@kernel.org
>> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org;
>> peter.ujfalusi@linux.intel.com; Liao, Bard <bard.liao@intel.com>
>> Subject: Re: [PATCH] soundwire: debugfs: add root-level peripherals table
>>
>> On 9/2/26 10:18, Bard Liao wrote:
>>> The table will let user know what peripherals are listed and get the
>>> detected status by the dev_num.
>>
>> This sounds useful indeed, but does this need to be in debugfs?
>>
>> We already have a sysfs entry for every peripheral listed in ACPI. Each
>> peripheral will have a set of properties extracted from DisCo tables,
>> could we piggy-back on all this and just expose the dev_num?
> 
> It is convenient for the user to get all information on top of the
> soundwire folder instead of looking for the information one by one
> in each peripheral folder.
Right, but as Charles suggested one could use a script to provide the
information in a more self-explanatory format.
That script could even be added to 'alsa-info' and make existing reports
better without needing kernel changes.
