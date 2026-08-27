Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714CA2620DE
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 04:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803225; cv=pass; b=mtEHXAqLsar3ErHmsus1bop9N7tnsqyZVJfeT2kbtmT3ZyDW9hiSeNtsTUpaOFLyAjtULPhRm6MVuwgCwGyTnc/G+tbwKqyekrjE7/Sy3EWaEobi7dQNXaxwHIQNruRoApGvW5Cbl2iMboUc7FSQAQGaKO2OpO1GBeKJQ/NvXcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803225; c=relaxed/simple;
	bh=oxkYlzhhuag4na2JWsclWG8wKntLbGrO1jgX1/Z8KNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBu5Ajp6gPdo013BI3Q//QQ/yCxfBHhxeW+MYOUwxv7ybhUBMhJZt8Se5uE1H4BERpeJJiWFDNsUr3QZOrkTlupAdEzJyhjCpihPJJ/BovKLb2GF+yoUwb1JiFfesFOMy5BdQlg4lzOfjIUHCFpcuqv8sxDzaGqRwf7lYJpbA3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzRmdEjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtJGRTaY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzRmdEjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtJGRTaY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3Iwlv3428194
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 04:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=; b=JzRmdEjSWbYhMJAP
	28tOehxuOJD3K4yGSPqxv0LdFqXkMtvZOB23dB/K31xMt7Pv2TA47vpzTgKU7Ezc
	Iq6OmQwp9PjkbDMIby8/ALPpdXBQcnMNalhZudHuzqKgu8Ui8z5zM5ddg5SR8pQg
	RbkP70O/dmvtcu7d/rTsRfVNmLDM6Xvu0v+iuhox2Q4LVtqpNB8QSfnzX+9Eph6t
	qWzBN4p26S2PvFR08DOH96lKGIwfx0XaRrAM+GEfapQN1G1W7n3915+/rEt36x+K
	vqwfehXcuXONIixlxDzuliiaizOLU7Y6R026AVEcSeggZogs1wHXx1ADTOIleidu
	a/zAvw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbtsvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 04:00:23 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66c767e23f6so567560d50.0
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 21:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787803222; cv=none;
        d=google.com; s=arc-20260327;
        b=nwKBlKmxydoL3Er+n+TDifaJniQIXA56ahQlZyAb2H9xXxF7J5GT/2cLngepPmkIw0
         k8z+l7K/CFtfd+On1t8KRF0ctFq6ooykEVRC5FxMFB5D+m9EuaXztMhHV9UrrAEk8SNt
         f4Ah1Rg0L+2T7QWE6598eT+wQg+fPhkYq3R0TdxwZvCBMJK/xeMEGWMawAryNIsM9JTK
         aOKlAgOrnwdk0pkHMBAVMDcTJtG6vLyhQWiHo65KVxjvSqGc24n27elaZmuu3zKmOisN
         ZsX27JTyNc8bfjnNlOgvkrGEl6/3jW3Sees++/FFYc70xG50Mjbo2oN56curOY6bp4vT
         Vkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        fh=/nNE05lf2YKHSzI7JyeS719eNrYo0pMsVTGFxhoKyuY=;
        b=KhFcMyg53bTDW4UjKqRenEecC7P2JkB7xYAWZPtyTfwLj+04KbVnTcDkGIJBurPGwD
         m3OXz8raL+KpOkZqKS+4/1c9nIomkNHnqh0Xfl9PKNbi0b9TzwsZ+WBkd+EIrDcg9Rno
         W9H2m5qnjAalUR+BfcQc6e4BSVFGjGlA8FTJsfG+eaJCDyEGXTNh2wuvFd/lxuQFG/rN
         i421aK2p1G45MV7QcvOG+CUcw5PtpHkDWzQ03+VAEXztquvWhDBne9rEUNB39sP0Hjos
         dRO0ZLFnZ9xqLnm5/+ywTMn6hE9eBWKi/kphuNESpvH1q6chmuXirGzRb5kMp2YqW2qe
         SL4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787803222; x=1788408022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        b=RtJGRTaYBa+MHc5N6c8i8KAzGCcr5ETGlzt6HAAdv8F2BBXRvJP30gLixJ4+AlEpDZ
         NUI3ZPbP8HjslKYvBxlVhQdGUSccx3NOwXgQU/iw4HLcsUA0+hrE+L5Y33EvgGRWTyxk
         S39SQb9xakqaN5JwLEox+ZM9RYoUsN7XDCokZmjJtwmWqrwyPdR3Yhj4alvAbF8v2ddI
         uObet1B5ehVSCdUFv9Nuk4BLo5IQP/9ZFlhMx3iEbQw0DBOTEIyEGqI4aHbt3e2thklT
         1y64b83UOuhzBIau8n3PKLUYlMPDE0OvYxGuubcnlDGmslhEh7qX0/TnqfJrfDyJb4jI
         ELmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803222; x=1788408022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        b=LLFR8kmI5A3E3Z88Vq3YeyWtfJzma6sJmJrbn3gCIWBO1Q6wSBXa60wYTPNH5GFTWk
         1lxBIUqGCWD3SpMKgiZSfdmEM2Ww/zN/7u1dar1gPNdeRdrbO2URCWI5FhWBjZ7VO5ra
         ld4+4qWn3rOHkH/iV5zeSh0xYnhGXzEMbAF8fXNVXiIE//FVE9leNDPS/FHfeqh8Xk8e
         CYg5jQc/uouh+gZcjcvnVM3X1h2jSTc1GUPSovcnKEXCqswcFHERbyWib0ve/+qGvuXg
         GNrzuMhFO8EzU9a5FM/qOkYGFWcXEZKHTmJod45TdEYYOm8+lom28xJfjiOzhnlWpTbc
         L7Ow==
X-Forwarded-Encrypted: i=1; AHgh+RqcgQwGNNUQ3eNikqEUmbqKmfJOatNXMw6wNt6X4Od/yry0UkfIx3jk+TbD1AvuDrUMHkas+iG8ZEtJ0w==@vger.kernel.org
X-Gm-Message-State: AFuF++n1YhoTdCIsbfkxb1Ybn5tyiHvzYWx7Za3+MvFY92wh2Gnzz8G4
	XCwxP+VYiiQaY8m+b08MWHZ7Z2u3aOMs3sSugD0USC9UgGlPg3NSc5DiBq3lccuvG8cV2JP6z+R
	T5zrW6dWDRDMzLqfxkbmIw9LDfymuJAmVR812F8tjz811bi1AgdueCeLDpfSvZbJ/xu4t7tWr3d
	NYcDX1y6f8NRq9bta5hJbi4PR4wzbbrkDveOWHYF/O
X-Gm-Gg: AR+sD119ajJUIOlvA9Qv7GFNABrikx4gDpIBqlK6pfz8XXdVHquB7V8wLoSUVLRgGuq
	6UXz6vrcofcpPkt7gndJSHbunnsC0IN1eo4Idz8Usmw0DNJNAmojJeGaZgOWIKha1ZVPAR/2Qz0
	uPTxPdfHhqA8poy6upW3dg7dlPlPbgkMfXxV//cYLlg8J3ZQBU2c8T4Ynurg==
X-Received: by 2002:a05:690e:111:b0:66d:7b7:e36c with SMTP id 956f58d0204a3-66d257eba9amr3248389d50.48.1787803222420;
        Wed, 26 Aug 2026 21:00:22 -0700 (PDT)
X-Received: by 2002:a05:690e:111:b0:66d:7b7:e36c with SMTP id
 956f58d0204a3-66d257eba9amr3248376d50.48.1787803222014; Wed, 26 Aug 2026
 21:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
In-Reply-To: <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:30:13 +0530
X-Gm-Features: AcwNN1VxELkZrglEk7cAJOduQPXP1zIrNjAfvcnJwAH-yznopOZrFR-Fw-ookJg
Message-ID: <CAC-tS8AfsCT+CY44EDQ17NUkhuPX8xT1tA=Soi+UwP6+HRoupQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Mark Brown <broonie@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: z0AQOm5JDxO8f1K7i5pHnWFAyqxgPvwq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAyOSBTYWx0ZWRfXxl0v47DA6DD3
 iCjm3yAO7NB+QEWCG8ojdiYLcZUzHF4mGaiLredIVie7eFhdjEnV0cCBL02H5nl/2rrLcy+kKF1
 MlRPcSiXAb9pJMThR3N12vr/LBGBCqg=
X-Proofpoint-GUID: z0AQOm5JDxO8f1K7i5pHnWFAyqxgPvwq
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8fb657 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=5jftPqpqXhJRGXY4JksA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAyOSBTYWx0ZWRfX4d9qPENMv/t/
 4ocmyeCi4IoWcRtM3sn5r2jdk+IB8fj4BNUEZsaIj0/wBSDtYB9ULPSZQ5V+GY/PPh/ov7ZnQJ9
 DiZ/Ob6frr/Rnh+d1meRksdgAzTOCqrfcX+lcBNIikv4AqGJGhXJ3MohvAGrjnlfGs4hcmh5QGS
 Oz6FdZzRri8C8sTf1CBG+yx+uhQG/VM0OhBpIIEhssg5n78riHg5OJpxvRkTAccA+44DYd9nr3V
 lvPghxaFPzabHDsePdS1p971KHmDuoZ8mk0WI+KYICh5VBuQUDrqjAvanFSy9gt8z+lg//mXVzx
 LKJYyfOaNi71Jckk7oisYTA8izf/mVJiWRCkfChbS9V2Mwmf19D2czq3rp0FaoYyJ/ezTCrVvES
 Po3KV0+y8Odhlexch1pKQK+SjcHcTMyYgv8HF04l43jpSLRA4AHD/MPMJrGtJqGF9GLO7wJ46sf
 1dZB60CCDCPBDfNefBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270029

On Thu, Aug 27, 2026 at 5:02=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 26, 2026 at 02:01:52PM +0530, Mohammad Rafi Shaik wrote:
> >
> >
> > On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> > > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > > interfaces and the internal Bolero/WCD codec. Platform Devicetree fil=
es
> > > need a binding to describe the controller resources, DAI cells and pe=
r-
> > > interface AIF configuration, and named constants to avoid raw numeric=
 IDs
> > > in sound-dai references and child-node reg values.
>
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.
Thanks for your suggestion, Will keep it in mind next time.
-Harendra
