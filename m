Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7082899
	for <linux-sound@vger.kernel.org>; Mon, 26 Aug 2024 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662967; cv=none; b=T+T2gszAGgwRP8ins/bwEWq+NPKUVYDpNkVEgg8wqzEqRCFxSb921GsmOv56oq/vVtWgK0BvSqS39QRyZC3uxUASIxk2tfrhPQRX6N/uSDJaMPsUANEwjmFMboWsXPxEFMGfBXKsn/oWQa0VyDl0lmIjjIU0df6bRszSNYv2kxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662967; c=relaxed/simple;
	bh=vrO3eCEfTdB8fb+vpB9lgzulhW9vSZogFyIvYtC03XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:CC:From:
	 In-Reply-To:Content-Type; b=tFet8GCnpaHC1HSKtInYo6fCOTmVOrGPN861sy4ync2dK4euyt5ofstIHNY9F9DHqaHimFBPVYouOLa7lNWkvOyDQsPOSiJLy9vMqD4YKVvYasic9eO0/XIwKXxkpnS+tAZXEZ15BwNdlzQPLoGixX/YCsmdJHXH01HAP4qTTHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kzm5VRxj; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kzm5VRxj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q4x3O0016643;
	Mon, 26 Aug 2024 04:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ecK5x+j/BWxnHZ/ZVgVJEM2gNJwH0Jkg73CL4kz/wn8=; b=
	kzm5VRxjhDb6lRGpfezxz7WhWN3Eq+FY8lxwbs+xlTiUQpnJPHS55h1FJ7VFtsPs
	gfE3OeyMg3vY9q3BQnzxnOu284TMeeFoD157Q54928PvOH0LYRF2yOZn/yP3sq+T
	NPvuPhmlzn5FGLeXGWOsrbOnltKndRvd1W7jdrANjjS+1yUI4PnhueWEJOyDHYH0
	7GVnRkAD9/HwNj+fGwdq39O8gQca2U6pNkKx6jC68I9dT+RQx33x766VBXHagWvD
	EYgI80Ejf0HVymHO3T6i8dInv6on3NghBEC6511n348kjNLyETpCN0EQEXMBF3Jl
	/4aiR8gcZUtcJYiBsjyvtA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 417cwxhddt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 04:02:37 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 Aug
 2024 10:02:35 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 26 Aug 2024 10:02:35 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 18CFE820249;
	Mon, 26 Aug 2024 09:02:35 +0000 (UTC)
Message-ID: <5a554db6-b278-4cd2-a637-3cc15a3b9caa@opensource.cirrus.com>
Date: Mon, 26 Aug 2024 10:02:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASUS GA605WI Tinny sound - No Amp?
To: Walt Holman <waltholman09@gmail.com>
References: <a8a1bdb3-bd25-45c9-82b2-e96765fc1168@gmail.com>
Content-Language: en-GB
CC: <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <a8a1bdb3-bd25-45c9-82b2-e96765fc1168@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Bq4bLq5Zk-b9hoofd9Uwbd5qAkB3hbsr
X-Proofpoint-ORIG-GUID: Bq4bLq5Zk-b9hoofd9Uwbd5qAkB3hbsr
X-Proofpoint-Spam-Reason: safe

On 24/08/2024 21:39, Walt Holman wrote:
> Hello,
> 
> I just purchased an ASUS Zephyrus G16 2024 laptop model # GA605WI. This 
> is a brand new model laptop with the AMD AI 370HX and Radeon 890 setup. 
> This particular model also has an Nvidia 4070 discrete GPU, but the 
> issue I'm having is with the sound. The amplifier doesn't appear to be 
> turning on the additional two speakers, and the sound is only coming out 
> of the tweeters, so it's weak and tinny. This laptop relies on the 
> CS35L56 and what appears to be a couple of amps according to dmesg. From 
> everything that I've read, I thought that maybe it didn't have the 
> correct _DSD setup correctly, but after following a guide for the ROG 
> laptops for creating the proper entries and setting them up as an early 
> load from grub, I believe that they're already there. Once I did that, 
> dmesg reported that there was already a SPKR i2C table that contained 
> the entries, so I'm fairly certain that it's not the ACPI / EFI missing 
> it. I noticed that in the sound/pci/hda/patch_realtek.c file there was a 
> quirk already for the 605W, but something must be missing still for this 
> model. I'm running 6.11.0 master with the latest git firmware tree. 
> Please let me know what information I can provide to help get this thing 
> running properly :)  Below is some relevant information re: the CS35L56 
> from dmesg if it helps. Let me know what else I can do. Thanks,
> 

It looks like your linux-firmware was not installed correctly.
Did you run the Makefile to install it, or are you just manually copying
files from the linux-firmware git repo? If you copy files manually, you
also need to manually create the symlinks that are listed in the WHENCE
file.

Specifically, you seem to be missing this symlink:

Link: cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1.wmfw -> 
cs35l56/CS35L56_Rev3.11.16.wmfw

