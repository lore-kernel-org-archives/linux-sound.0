Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575162;
	b=eR3ebeeNLCL1cFpIrVLN4KoRM2J9gE2VOSg7HvQjIk2QZZGlfVs9yuL0y0sZwt3mKFr3
	 C0AnUk5gjNYLQ8Qnd56IEpVoYPrbUrmbA6m8xSAiPMrU6cef/9z8+Lqz1nhF1V7WijMmv
	 CV625q6g20Ci7mhAzHiME7HAGzRcvZVFxsJu2DA2C4JEh/y5k3/5wwlcFu6/qznO21L2o
	 WYaM1Y9veYTJ1oHKhGrSzJecEmb4sHFm66md4Nma/MR+Hs+iYkY/3KezTvzTbmI9NLRmQ
	 hvRD4vjNcVOWy5ezSezCIX1gVgdU3UsWrXFV8eRqj+4vK802HCxiWIzAvGQ4JZL4jAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
	b=sBH5xXFFAVR9j4uIIFIbyP4nQagWTV//3Ry4qCAeT566VMTBu6WsULukhONDDT3YD1Sc
	 4VZra/SvJuaWcDPT0O9wwKzjz2j5RbQtu6B+HXY2J1ow4cFBXsSHjMISU4q1X+Q3EloFl
	 hp9920VxjubQX41pTCHgLNkOTd0aUcNN+7tRxnnmT4r0WjRyvewtffUC2e/dwlSPthpKm
	 bhV7cewI/uKLDUIsD96nYvQV/ONxkADI95LPYlAEaEkVTnGG4tbNrsCF7Cgpf6IL+QN7x
	 tyUhj1nUkbeQ+BP26xEniE6oR9av5opJoRKSdnvWQG+xkfA5SzFkEp/4J02Bqs68cyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94DD606A320
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94DD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jJpp2848213
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=; b=JUtPRNxxI67F6Hv3
	kk03khUGkyKsuGjWIQMaGq2/MOQBBc/V33NO6OeW38ML6V/KVU3RhV2cGXOXSYB/
	1cjnMSPhbOl1RCxQVx+O0PnvNQQNzH1oG/p72Cqnd6rrB8n5DTPknV3S9VRhHXIl
	nCFuO8YVNFXozMw5MVCjRBn1VDqLT7On1XG2BOJJ3HJ7ScphFTDZCv/FelQR/aIf
	Dh83BrZ1VhPZFrZ8iBKMu2tyY6GAuRk3XFZe3GjD4mid/xW/Vw1GlJFz4h0P+8IL
	F33bpLGLY9OScl9ZxVnQiKQrk0dY8jCijAbqMQfOpW0ZSrqOsjCQlszcVa1D6XyW
	90I1uA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9b2w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533962f6bc9so1470081cf.1
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575160; x=1793179960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=jY3AlhAyweYyNw6+MCdXN79EwCBjjAPJd58GmV5vhpMeDtZRu0JL/rd0UmwV92Zmbw
         xOoY2TuZdXZdoiubQc4kNt7gIwVN+5SqW/oqKT0g2XHl6ENBZuerzKHrDlNndQOCLrsa
         JT+xpEq1nscQviX8oVrNnnsiDyQGVaNjgHlAn4lBjBKbH9rgN7eVLGTVO00ZpHgF9P2A
         6hRFpqRn983GnD++ydUa4QZZMK73XPwwHXxK0Aapm/3LGehubvvVPnyzvR+yDMdllsq2
         OxtyqqW2RWEEF1KO8ZXMkaO5+9VdEBFT1UtNsuR00zNMvhmjOJ0gV2lOW6TYLrwCqxa1
         BmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575160; x=1793179960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=xIqw9DMc+EjzOni7zEOfUSV7ULb1daQCXJMPIRXD1t1OFtDQDzDuHsgIXDXEYEp0FS
         5eptgv+J3kD2MdvjJS7pq/fEEKMCTIKouR+1cTnkA+pVTwlGzOyo0IkPuwXD6PDYsixs
         NI7CztgQgUjyIfc6wg5LkIyZrm8YK94G2o0o4V7Q2Brbri42un8ZY0py/66SARSNzpQl
         a1+tKDcyj8QWRXluhZJ/6IwhGk3SVax3HD7CMvsjlqrNIUb/75t6fAm/Gu+FCL/kPBor
         wUAlrSZPx4CvoJCqR3IemCZLXPI0BaH4U/qz/DtHB3EqL9fvJHY+WRaCVd15aTsPUP9H
         9ZiQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7HprnSZU9+mUC6QggJY6hiPnx77FQcKhxW5LqckZnAKjHxwF65ys/Il+W5yG2aCZzpVKNEbAtznDtGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqf/4IHzpVSbOLtzSA8x/jEPOdPXczMFJ3jMHvlBQsC21GkeoM
	HTyVx09+10SDKdH1kK24NeeaNKuY4z3wfoukVi+KCbe1qg72DKA4fH2CpHEDqr2pRgC9U/4Z0Hk
	PKabXFstPmqIP6vNDcRpqi+zhO/lwr4ex/53HejQ3S1M2AMg36Nlzc8yy1L3Oetz5+A==
X-Gm-Gg: AYBFou1Zz8fLE2A5jJGsiUOeN0C6qg4rvOG17d8IrFu9YPlL8Um3pO0CnFxsDMTXLWk
	KYEVfuaXUl0/a3QVuOJ55H8x81xEd6VnTgTVmTbsksdH+TIbNWV+g6ef6joSk5+9MD3JlRTo+0R
	HgGpKeP8NXGENxgdIf8aRAIfnzWwyvFiF2CpQZFv/lIaCdSrPMvnM9QqAjaqx9AbFS+V8S/ruMS
	n/2T5wIRSEUt8hY+cwEjRd2sVfptg8nyNkjNKrz9VyL9edRREj0wKLZBViFqWYV4Rjm7/82eKgP
	rjdoyIMTbxUavGDJytn2VdNb8RFa7kkvPh24LuGXGCmnb4M8/g5WagJd3QHfwGuEboWE45zAlfh
	L5zXjT+1CpelvGW4qhPm8eQ==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271501cf.0.1792575159815;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271151cf.0.1792575159341;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7b728sm58385366b.29.2026.10.21.02.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:38 -0700 (PDT)
Message-ID: <124dbc57-162c-48a5-b405-73f3b560bcf0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:34 +0200
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
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXzHAx/FV+W625
 VuOt864YjcgJKCWKDKKgQXgj0fQi2ds+buaxGrVyTm5oRUyJOx+sb0JXzGp8mNLz/lGcUyBhMPs
 ygNfYNw2w6cgE5ppBzm4imWV6VEakSk=
X-Proofpoint-GUID: KYwlJCFId7n7PDmPVi6zVFgiCUMK0yt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX0JWSui6W6EV5
 0m8EvbK+qrC79/W0gZx2mzMxseq7wyq8gUtXC2BPQPAIw3fQx1SEnJLq2BKbiL2ITiFHk9c4Ojl
 7IiGzCPcI8Ec99CC1zSWsdbuFTOEW7Ep6KO6S69wuBxGcHld2NEKUApZsXFKluI2l3oQQ7LLC9w
 1mMrK8OBtippM/3KoQVK7QnuDyA7r9E/H/KXJpNCiGCUi4J/rRxuBU90DlMN3hoTvoHH9KERsgp
 HwHKXhPpT5k6rVlN36fUY0TT5DHIAKykE3Fe+ZOFZuZEZf6kVGqWph2N6+gtZ8iXJ02t2gm+g1e
 IdtT7jnJeYZK9s7bmOvlAue/Tnq6upu2YyCacm02mY/W5iFTir8FRa1sx8hwoknA//VReQy0H1o
 vyhcALluXHXHSKeiDnbulOghbYe4dhU78vl18mO58rlGQmjWZ81A4fHRbhEKiXY5+9Hnmx9sgWs
 ynFfLNrUhC01vSWq5Qw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad886b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KYwlJCFId7n7PDmPVi6zVFgiCUMK0yt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones
> 
> Based on work done by Casey Tunturi.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
