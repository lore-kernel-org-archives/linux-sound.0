Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863E81F03D9
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 00:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773879861; cv=none; b=p9m/DMxcEbRCI7pwJQHpFGlCQYF42CaM/wTGXh+ZT4GkMBvGYb1MXXdCEPFEL33atJdftvklCLOYP76cpgyXKLhxPY+v2MKaCYK1OCoUFRnAhYxVzf/2kRxbRiWcIrdCo04vRBf/zgKYUM8ffcLSlNUS36hpc+zJ5BJgPeeyxpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773879861; c=relaxed/simple;
	bh=w2kN1Wt6YzXXSYzOAE1y0ntW2hKC/n3AiWKluzdu+Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTM6rQ+Rppi/rEXe7+gekgY7BLpQrCb1mjJSWPYR2XQmYgxkl0ZwnB9PMww3WgOxi4n/evf9ZS/lgJobc0m6OkzEVNUe8QMNqq8gRpx0Irgj6fAU1r/0mCDGMsjAj2izuVdJN8umMkWhnNpp8V/j4CKXnXDjTcnR0W9ZHRqGEI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gpqrthyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aO6dZthf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gpqrthyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aO6dZthf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFgbZX003846
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 00:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0B6sjvs+Y6RCd+g54byUmvgds2mIajhD9yE0iKWSpE=; b=Gpqrthyw1q6ZVv4s
	LnZf8vr+0+50n/jcrYlR0zBvIcdwLhJcTHyTQ+UIRDLTXQWfeQOpSxkyxUX3sojW
	oBffv5oC0ZpSTOxbXIy071y7t9ibWXASiESohlFm+G5/yiRgO2JesI/Ba35nLZT8
	m1UwCojuliUlfRZjiy1DW5I2PODiNNVLw3To00xoiACqp4CbkB/LPiAfwNkjQOIQ
	bHK61Uws6gqoTwVY+GCxS+ftEDgS/8ri8j3HG2reme83kO4PBMnISjSbELzwGej5
	C2Awy6Y/s3RcOr+0LRwyrekGYkm6Jv9dheLudDr0t8IhlSQwfT8g5Ysi8jZdTYlg
	aZOAKw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb2yhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 00:24:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1276e71652fso461073c88.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 17:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773879855; x=1774484655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0B6sjvs+Y6RCd+g54byUmvgds2mIajhD9yE0iKWSpE=;
        b=aO6dZthfAQtaqyfiymFIcqz11yP/82iM4LOCnE7q/gcirJ6srLvUDSoIzx0sNexpI1
         B1Y2TI9U5LF+mStIhOQV1DtORqtjUYp1hebNXLgXxVWuDMITneHitdCVEOON/SxNABUD
         p1BMV8J0QnO9scIEk0b1CT2P289W/lzfzKdQIf3BKxMVw9XhB4sCHENPbqpDl9vCZUbA
         dqOQAoDK5XDIzwEjMOzFO5fZuwLa/G35ORd5mZaF+fgvURz0nqEF+MrBOFBcmCTAcbS2
         qUdGX3c/chZxZH8D2XI60zahCc4FJy/ZnLqMDzKgMdqHEUhcnJu6pYtPG5Lw5jDkuXyq
         +owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773879855; x=1774484655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0B6sjvs+Y6RCd+g54byUmvgds2mIajhD9yE0iKWSpE=;
        b=Lv8T7MoY3YfpZR0mQj1bM8/UVGDbfSso0AKKXQN4e8iHdyyd4bUYcrYWqOiimcd0rf
         I0fUdskUTYDEQ5o00ThLfXHJh5pl6p2g4DoMZOLG5N4A9TNbsoh7cV/YJ6FURp0TOTQo
         zul81kP3MQo+AXJTYwgW+dX2hBkij5BiiijUq1cuBkBDEcJENf0iE3CFt7d7GLSVjeSe
         0+NXGxiHH+sdG04TG6AJo6l2UD55LcXaEQ8lCEfthdl5liYtSb1pL6+JMtJrewqA3Ryu
         PxhC695Qc5jcrnZCEeiIw8OTGmj5kWqxF0tuO4SWWBhGMxx/M7vSsU7mjV4mvkIWOOq/
         pptA==
X-Forwarded-Encrypted: i=1; AJvYcCVIvIaLcn8d18is7OmBrmLMeJpQE6LuY5LZtlDObggyLW01d4Ov9xa8pjEmmrwN9kLvbFylqlWNK52cvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCZLfWzDX3wxYLrRYLI01kqMhjXcy8HvvrSiXN7rfZAIHMXWY
	Y/Ah2GjiugugDkM1odh0SpZgxgMNfGbOF/8V6fSNTKjdWPhz/X+7xqe1BGh6nBeL7fzKvkg/djI
	vXckwZeiCU04rlfu64lYxfDz44rROCDp3U15rcU/ravfC1+C0DXpq3M4utdZHyGyHNT7Bnzl+XA
	==
X-Gm-Gg: ATEYQzzyVpNFqrqqVOUq0m2kSm8grLJPdA1a72hwYAnrLIo5dLlBxeZrIvW8298oxcg
	ZCYL9hhdt9DLHQmoyEiRRqwS3O6pzK7ykx58210ijr8jYTA3p2vRiPjPNUQzCxJxoyOUbW6J8yC
	nzkfj/IZzNtETNRl8iAWlpVZkA8ASsJjNEk3xzjGuORSlr/vHLlNqv1zx70VKbgZYfCidvH4U/m
	KI4TeYI0qYGNfjt8UO0Ce0+BydEOMHsb3LlS2TanG5YHn1A/4I2QI0MfCmcNCgF+aiskM3lEVVk
	wyIlaYsaaYnnWf9Q0mxwGbFbNC6CHOZedDS7kSYtt0A2eQLxARTjrdXp6DIqOHuBQgoL/ETWC0n
	NLK6Z7o8CnK+G99n/uGay9/+FScWTj4sRGvwbiE65IK7ojb1B3Y1l6H3U8KCXpGfvWVCZ
X-Received: by 2002:a05:7022:6b97:b0:127:3b16:bf4f with SMTP id a92af1059eb24-129a710116fmr2822222c88.40.1773879854780;
        Wed, 18 Mar 2026 17:24:14 -0700 (PDT)
X-Received: by 2002:a05:7022:6b97:b0:127:3b16:bf4f with SMTP id a92af1059eb24-129a710116fmr2822212c88.40.1773879854105;
        Wed, 18 Mar 2026 17:24:14 -0700 (PDT)
Received: from [10.73.193.53] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a7153051sm5052505c88.0.2026.03.18.17.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 17:24:13 -0700 (PDT)
Message-ID: <4e551ffa-1952-42a9-8f92-d77445134cb9@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 17:24:12 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] usb: offload: move device locking to callers in
 offload.c
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz,
        tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org,
        arnd@arndb.de, christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, stable@vger.kernel.org,
        Hailong Liu <hailong.liu@oppo.com>
References: <20260309022205.28136-1-guanyulin@google.com>
 <20260309022205.28136-2-guanyulin@google.com>
 <505ab422-f933-4674-8f93-8744d0e67c6d@oss.qualcomm.com>
 <CAOuDEK3b4BtHVYhLH_NkE1fP1-9ncqvAq6VedBzWLm=D_YDHQg@mail.gmail.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <CAOuDEK3b4BtHVYhLH_NkE1fP1-9ncqvAq6VedBzWLm=D_YDHQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6w1jRDLMtGTIiHWE-0aKsA_W0qWBl2WU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAwMCBTYWx0ZWRfXxskPcU73bj8M
 Iqz8728Jc72NuKF1rdUCLsg/Y/9ciPWXTGx2f+rPxAsHgJuXFr9KykuLDcW67BdTUWikD7vcoSC
 pPkXAKlbd+n1CsylnSscophxULhiqHt3qVR6BtMXK3/QIlZDSw4K7dbCoCEDplmZIUnAgKyVytL
 AU3XNfA4CY8/nVp9EHjZDZu20shY+nKLR+1wmoQh9VQX6lZamXwT4kfTWrrdx3bSOErEMhQGu8s
 K8QD6LVLGA3Q7w160lB7MsbWcaYeZsTHOHyB1DX8SQPHFYz+6ogW79MFAXwuAayi/LnJis8K+k5
 C31TevphUKoaVARZxa+RNcHBYtIq9W/kU8kezntk0ScYpsr2yL2E9gbIt3nLmEzXvjmwjw7yj9C
 C01R7XwaMzTB1FX/lx8xxghEDl4bPXxpqR/qc9jYEgeucH4SWan4M1FyUu0mNHXW9IL/n4SE4E4
 rdpAs+Qlvx0gEYwNteQ==
X-Proofpoint-GUID: 6w1jRDLMtGTIiHWE-0aKsA_W0qWBl2WU
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bb4230 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=noPRdpk5V4PNhb5v0mIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190000



On 3/18/2026 4:21 PM, Guan-Yu Lin wrote:
> On Tue, Mar 17, 2026 at 4:17 PM Wesley Cheng
> <wesley.cheng@oss.qualcomm.com> wrote:
>>
>> On 3/8/2026 7:22 PM, Guan-Yu Lin wrote:
>>>
>>> @@ -27,31 +28,25 @@ int usb_offload_get(struct usb_device *udev)
>>>    {
>>>        int ret;
>>>
>>> -     usb_lock_device(udev);
>>> -     if (udev->state == USB_STATE_NOTATTACHED) {
>>> -             usb_unlock_device(udev);
>>> +     device_lock_assert(&udev->dev);
>>> +
>>> +     if (udev->state == USB_STATE_NOTATTACHED)
>>>                return -ENODEV;
>>> -     }
> 
> Could be removed. Since the udev is in USB_STATE_NOTATTACHED. I expect
> the data structure being cleaned afterwards, so actually counter value
> might not be important at this moment.
> 
>>>
>>>        if (udev->state == USB_STATE_SUSPENDED ||
>>> -                udev->offload_at_suspend) {
>>> -             usb_unlock_device(udev);
>>> +         udev->offload_at_suspend)
>>>                return -EBUSY;
>>> -     }
>>>
> 
> This check is still required. Because the suspend/resume process
> depends on the counter value, we can't modify the counter value while
> the device is suspended. If we do so, we will have an unbalanced
> suspend resume operation.
> 
> However, we might only need to check for udev->offload_at_suspend (if
> we ensure the device is active when we want to incremant the counter):
> 1. If the offload_usage_count is 0, we won't decrement counts at this moment.
> 2. If the offload_usage_count is not 0, the offload_at_suspend flag
> will be true anyway.
> 
>>
>> Do we really need to be explicitly checking for the usb device state before
>> we touch the offload_usage count?  In the end, its a reference count that
>> determines how many consumers are active for a specific interrupter, so my
>> question revolves around if we need to have such strict checks.
>>
> 
> Please find the explanation for each check above.
> 
>>>        /*
>>>         * offload_usage could only be modified when the device is active, since
>>>         * it will alter the suspend flow of the device.
>>>         */
>>>        ret = usb_autoresume_device(udev);
>>> -     if (ret < 0) {
>>> -             usb_unlock_device(udev);
>>> +     if (ret < 0)
>>>                return ret;
>>> -     }
>>>
>>
>> IMO this should be handled already by the class driver, and if not, what is
>> the harm?
>>
> 
> We can only increment the usage count when the device is active. For
> counter decrement, the device could be in any state.
> 
> My initial design is to resume the device and then modify the usage
> count. Another option is to check only whether the USB device is
> active via pm_runtime_get_if_active, and leave the device-resuming
> effort to the class driver. Do you think this is the better approach?
> 

I think I prefer the active check over RPM versus forcing a device resume.

>>>        udev->offload_usage++;
>>>        usb_autosuspend_device(udev);
>>> -     usb_unlock_device(udev);
>>>
>>>        return ret;
>>>    }
>>> @@ -64,6 +59,7 @@ EXPORT_SYMBOL_GPL(usb_offload_get);
>>>     * The inverse operation of usb_offload_get, which drops the offload_usage of
>>>     * a USB device. This information allows the USB driver to adjust its power
>>>     * management policy based on offload activity.
>>> + * The caller must hold @udev's device lock.
>>>     *
>>>     * Return: 0 on success. A negative error code otherwise.
>>>     */
>>> @@ -71,33 +67,27 @@ int usb_offload_put(struct usb_device *udev)
>>>    {
>>>        int ret;
>>>
>>> -     usb_lock_device(udev);
>>> -     if (udev->state == USB_STATE_NOTATTACHED) {
>>> -             usb_unlock_device(udev);
>>> +     device_lock_assert(&udev->dev);
>>> +
>>> +     if (udev->state == USB_STATE_NOTATTACHED)
>>>                return -ENODEV;
>>> -     }
>>>
>>>        if (udev->state == USB_STATE_SUSPENDED ||
>>> -                udev->offload_at_suspend) {
>>> -             usb_unlock_device(udev);
>>> +         udev->offload_at_suspend)
>>>                return -EBUSY;
>>> -     }
>>>
>>
>> During your testing, did you ever run into any unbalanced counter issues
>> due to the above early exit conditions?
>>
>> I guess these are all just questions to see if we can remove the need to
>> lock the udev mutex, and move to a local mutex for the offload framework.
>> That would address the locking concerns being brought up by Greg, etc...
>>
>> Thanks
>> Wesley Cheng
>>
> 
> While developing the initial patch set, I did encounter the counter imbalance.
> 
> Following the discussion, we could move the device resume effort to
> the class driver. This way we only need to check if the device is
> active before manipulating the offload usage counter, which doesn't
> require a device lock. Is there any concern with this approach?
> 

I think that is what I was getting to.  Now, instead of having to rely on 
the udev lock, you can protect the counter using a local mutex, which 
should avoid the deadlock mentioned by Oppo.  You can avoid also having the 
class driver worry about locking requirements, etc..

Thanks
Wesley Cheng

