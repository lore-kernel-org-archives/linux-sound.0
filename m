Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879ED3CF04E
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438431; cv=none; b=F35rpxaBI1/ZB/VsQR4GBzGcPQq9ZOIl4JzQYDmLgoVSN65ir9wa/kCTxe0cjbcSSZNqOx+xbllL//o6Mgtnjy4MPzz1Yi9yERcvp8RcIGWKbNer3U+GQ7scqDlB/DxizbdlTk7I+bOoQfeBIlOwfkv+lqwbpfNMmaaSa7FSCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438431; c=relaxed/simple;
	bh=zrTu/Fk6R5LsUpKkvhxFJueXyQGTKcxc82WecP7Bj1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fpcqo0gBPRV8grD5c7LHDoiFD88UUg3txnpEpwwvYw9YqCD4aT/abir+iiZjQfdkGZ1I/DXIpGAHigeu4jThzpkE8rkDLsXREvKLdW4+Xd/mtO6F7GYcIegfTFIVE1qfhlWTSRcI3G3ePkr/lXG+dUX1TKrGg84FH1RgOO0krns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDLQjUn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T1dtl4/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDLQjUn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T1dtl4/v"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGdeC1626575
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=; b=oDLQjUn7PQCQaBbM
	l2/1sUxAIvkFNa0FmE7FkXoSDecF85GqndHd+u2p4AxReIWS1eKqI3hnDmspBVl1
	cIS/sEPMfzwnFlI5xm6J1vAmMk2ooI7V6KmNlXZIrJmJ83UN+RNVAkJP13zEDqbV
	pRVqOFXsPQ6+zyrm35yLA4rVLRlJFIfu69VQjdFrrhgwlEf1nASMXC8mrtDNWLkw
	sOgK0XKIMm6l5EnpuNUss1dOLbC4SEWYO2K88zzUchOuQdiiGOe/t4zOTYp7HXPf
	zHhoPPFl0p4POv/6/GE6LsxaSBLGsxYRwM3SuAX3Tirrcle8ted4BlTL3eRUcaJv
	dMiXNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489whhnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:33:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093787e2fdso319873201cf.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 04:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438427; x=1775043227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=;
        b=T1dtl4/vh6MDQm0BIbaZGCDoK9PFKSVVS2ZPEZGJRLdeMmi4KJv1dTRlALnaWw6kJX
         Hn96nYZdSsqxrQqWFYZCAY3DJpDU1yoHZ+T0Z/Bi8nprCHIRwtuEQikKXCy1TyYhA8+Z
         tPz8eIBc2Xrr7mnmzE8QqVg+bpiYYF5HI4lBovsZu5OLmzNikehMzmL2+snfO5j2Bezc
         KFJwrt8wzihyzmW2NilME+HVePI+7l2sfjASzYA+sXQAEjYsVCr4Jwlnv8nkYrkb3hZ8
         9/8QfMXOIr9n1jD8pAfwn6UNiObJcvQdD+dw0lC1pikMPooNuZWMf5+dzLILPafDcxbT
         tARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438427; x=1775043227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=;
        b=Rc2Hqhv+ITzoQZ3ntxuZUjF+jODRsWIhdzEX2vLIXjvBVKxsEXx/wHqx2t+9NSmdXD
         7CypG+2izy0PDMJy16KkubchMq2oOrh7ordUEqIYaBH5aXeT+CAa/5XDpj98ZCyGqSq4
         0WfmleKyK+yTUnuQG7bw59gpwdIRvobLKS3voWGGkJ7lp38p0hgw4Fcd2CtxiNfceXK6
         oG5X152/a4Mrx6isQGLKVnH46ry2FEt9pbq2+D0llplXIW1U65ZzBBaDNLDq8+i12eFw
         THmQ7pvFfHeWyqS6dNuXF8+ab/KLsfoOJsfKl9DM306Cs0pswv3jwnhGsdxDjWS7hvwl
         zVZg==
X-Forwarded-Encrypted: i=1; AJvYcCU12ODfcywlHlbCmpVV8MCBqjc3SopF+1tcO3KCN4wC8UtdIL5ULzS9UDOgRvHYyLiMOlwI+cPrJ2qwEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVflUL9IemPhzBUoDsOwj4S/A0tRuFYrW4h7zeiiwefWtXnoZ7
	f4tWbRuUaWCCvYTTGxgsXDxLi4hVqFDfQmLqgBoRmyUTwDqJkMsloAma1WjWj4cFmVY90drKv7E
	zk7qb6Vi/8r+sXAsv3d156LZGOSMX4E/2b46StFAq1QvxI/l9yWHM/Dx39siZBw/c3A==
X-Gm-Gg: ATEYQzzvwjpOnDOe4Tw6+Tc0tTZBxT1fkDLmn0nG0i3enkSspOQyn1k/Hc7b9La/2xL
	VgcmPb4nENxZYTRKWPl+dCgwjRTTlofWJnwsNvR2D00wnspjjQhkATa/OhqyxePUF/px9hTA6EY
	dFt0+41aVuYCDwd2Psa1hWsxL0H4E6ux1Q7iaWkycOvCb4eT/F8sYh4IpD1PCetGABGKA2iiIO6
	BJZBKP7FbV5vZnVizRrCwjF78Fk8v8D7woyPlF9FJp742+v4JaNM2E1CKFV4gdKesAPOlFQbT7d
	eJ1IDfT5yMdGm5q1C9Cy+84LNF302cQ9Ku6exbCoOuiXwO23yRKckYJXBbhezaX0xqbv0/gIqCu
	jA1Io74FdtOtfzznp3gRimhMOqerl481sE6NQNSSYcqWLKdrz
X-Received: by 2002:a05:622a:5c95:b0:50b:483d:3669 with SMTP id d75a77b69052e-50b80e82d15mr40947701cf.62.1774438427581;
        Wed, 25 Mar 2026 04:33:47 -0700 (PDT)
X-Received: by 2002:a05:622a:5c95:b0:50b:483d:3669 with SMTP id d75a77b69052e-50b80e82d15mr40947341cf.62.1774438427032;
        Wed, 25 Mar 2026 04:33:47 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871728a19dsm40109145e9.1.2026.03.25.04.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:33:46 -0700 (PDT)
Message-ID: <e03b2cf2-08a0-49c8-8ae6-1651de301a08@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:33:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph
 opens
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com, Stable@vger.kernel.org
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
 <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iYVjym1f2f24B45vshCJBJt-IWA3C_1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MSBTYWx0ZWRfX8/FMPhWm+fba
 d8UUco4c41kL+gNnkh9pi+aWIEk5RSRDfkPDwn8PVeYOp8yQ5yPDyrWHAxyL8kpeWAki1kZVeOj
 77jhyE6jhiUZB+W4LRUFVe95/9cVprOejngvMHimXMm5bAF5Nky3SubXxPkvg6SDiJmlaiYgta8
 i274wLtL+qw0gFsTP+uCUSYa1OIRPs+mUkmr95GUX2Ei0DoZpncLp5LnUxL33kLdZoAPNItCUDH
 VuA5+QnsXLug4GMmHbjNRc80u1s8zFkTrQcSGJdCCkhjR1XyRMYd45/q0yP7j2bsQlb8FCmUkUB
 8Iae3+ZLt7OEiwnkeKJnnfJ+B9hnS6D2Pnh1oLArqlV3KTnSb9/M3bkG540yvuiR/qkCFjNIwaf
 joteL+YVwlqL+FGojYCNCd+TdK40aZiT4IXOLExJWpBID8iaY/TmabdobxIuBLEjaMZs54mNekL
 VSK3HXHLFSAlDkgTzeA==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3c81c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=kvLm1XpQD2xK1ocldNYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: iYVjym1f2f24B45vshCJBJt-IWA3C_1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250081



On 3/24/26 6:25 PM, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:36PM +0000, Srinivas Kandagatla wrote:
>> As prepare can be called mulitple times, this can result in multiple
>> graph opens for playback path.
> 
>>  	 */
>> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
> 
> This is an array of APM_PORT_MAX elements but we have DAI IDs in the DT
> bindings over that and now we're using the DAI ID to index into the

The driver has dai->id indexing the array in most places, and that is
how it has been for a while. This is one of the problem which last patch
is trying to address doing a check on the range. At somepoint we need to
move to dynamic allocation tbh.

--srini
> array (I didn't check for existing instances...).  This might be
> impossible due to system design though.

