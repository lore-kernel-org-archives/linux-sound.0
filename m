Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330715;
	b=hEXMCGC44dO/xKxbGgliTmwtrDuurYNFYl9KM70TeASVFhbxiwxDF1/kCCdnFNI0N1b3
	 psHsxdVBejBNfheuruJJ24gMzYn0WQXt+dCEugW6Yau9cHjtk3AnhmOQEkhPfi2brLp0M
	 rRQbfUqb5V2iH5enfwU45iJtMD6V51JPzC+BDsKDe8o4DarRYznlpbm5UMXCrwRzpu6A4
	 dlVXR0J2bmS7nrAuiiU9soIPbVDtE0xcMeiCzISaUEpp4ZJOp5+bJC7poDGM4pz8I4YWx
	 3vm9hTZplRw9Phwzb0IOL5uE5253YwXtXJ+TDXuXlLUxE5QQpYQ3zifVTecNXBV7VLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330715;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LTPySxtRP1mhuGtp2d44lAr7HZtRbwcpZz5yzjK7Fyo=;
	b=EcZ5uDYRubDTwxr5fXpOiwyjoaNrkmw3eP9EquiOJ3eNrQJni19t7A8d6Ouq3clPNnjz
	 di2fSE+m3Ik9yxiThMHaYj9iGx5gGkjj0U3nlhkChiDqwfJ55jJHYhyX7qB8/Y/tleh4S
	 6vd124C8ZXy8rcOwI8UsBmuBSG7hDaxhBIk6wDIjPhAF+Va6ImkWGeICbi7TqOFcRnQxe
	 jpd5eYqfZl09cZKGqOLi4M/oZpzZOMi9S8Cyv+udW2jgkBfiD4dRpGFqHiiHag+jFUZjg
	 FtGF2crnQFhU9jwVp9AhVq96ZLL9NS02TkhhJgPSc4RKTVRpkA9LiQY95mRNf72BPyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.207
Received: from mta0.migadu.com (out-207.mta0.migadu.com [91.218.175.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C00A606A320
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 17:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C00A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X4P8M2eL1l7eNC5yn66sPQqhZZRuCsoALzO5XvMzrMc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794330702; v=1; x=1794935502;
 b=cRd+TMqixPjos+3x/CzF5ONymZR3b06vCkzI7IGn8mSxTU0vI2tFTYdvKsj8LHGYA1RRs7W+
 JbXVTmZpxpVXDcKRquVcL48bWm9UqAfH1nhCLDizvLJW/9nejuyxc4nVlLnm+1e2zerePQthuIA
 chE+DPkPNlG+jRdBwObfjBsY=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b2a74a0ee3b8deb9;
	Tue, 10 Nov 2026 17:11:42 +0000
X-Mizu-Trace-ID: b2a74a0ee3b8deb9
X-Migadu-Flow: FLOW_OUT
Message-ID: <c477aed9-6b9c-4db1-8549-e1a407f55e43@linux.dev>
Date: Tue, 10 Nov 2026 18:11:13 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soundwire: Assume default maximum valid channel if
 not specified
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
 <20261110113842.347883-3-ckeepax@opensource.cirrus.com>
 <105b2b77-7eb6-4b96-821d-51af94a2e21d@linux.dev>
 <avMziZ9tYT5lg0Oa@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <avMziZ9tYT5lg0Oa@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 16:08, Charles Keepax wrote:
> On Tue, Nov 10, 2026 at 03:30:43PM +0100, Pierre-Louis Bossart wrote:
>> On 11/10/26 12:38, Charles Keepax wrote:
>>> +		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
>>> +					 &dpn[i].min_ch);
>>> +
>>> +		ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
>>> +					       &dpn[i].max_ch);
>>> +		if (ret && !dpn[i].num_channels)
>>> +			dpn[i].max_ch = 7;
>>> +
>>
>> this works, maybe with one possible improvement: in theory if
>> "mipi-sdw-channel-number-list" is defined one can ignore the min/max,
>> the two approaches with the list or min/max are mutually exclusive.
>>
>> Something like this:
>>
>> if (!dpn[i].num_channels) {
>> 	fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
>> 				 &dpn[i].min_ch);
>> 	ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
>> 					       &dpn[i].max_ch);
>> 	if (ret)
>> 		dpn[i].max_ch = 7;
>> }
> 
> I am happy to do so if you feel strongly. However, the spec
> doesn't really appear to rule out both being present, it does
> imply that the channel list takes precedence. But given it
> doesn't rule out having both, I quite like parsing both and
> allowing the driver to make a decision about what to do with
> that information.
humm, the wording "Conditions: If Property mipi-sdw-channel-number-list
is present, then this [mipi-sdw-max-channel-number ]Property shall not
be present" is pretty strong.

I don't mind keeping your existing code but then we'd need to add a
comment to say that we discarded the 'shall' to cover potentially broken
cases.
