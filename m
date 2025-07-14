Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC0F1FDE02
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 20:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752525588; cv=none; b=BhwOeKbmgso3sut7hK3b7bH+fbarBzttLADte7GbxYqgYO1jh9EO+oj7qOwQgS2VeAn8no5+wL9PeC4zNY8y4Xtv6yuXF4rGfsr4yPtPvNe4bGQJJD1R8AjL7sX6j2WQMIectRYJRkJ6CfAUWH/354yxBRnelafopezkOiAMSV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752525588; c=relaxed/simple;
	bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJRf5j7GAc1JwNTfi8VPVVFEyNFrVkzZTe+Vxg/krHdY9tOO2jX7OzxaOnU4jIbRRVNKoqNvGqFSeDDqlHsJnm++xddvncchjLMhS9k2SeFuMnlJ1hFJuaxmY+MQqUTUGrz99MwQciPZx9cfhKZPPlhZNtb3GDy6PEsihtQqfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hdx5CKLj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hdx5CKLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752525585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
	b=hdx5CKLjjObDkhxfqqEyk+jHihqqe1FXkiYcBMON9SEMFMKDUdcwpPr6+nasye1xoN82d7
	8WO6JzeO5tRFzhETQx7NXyw7JJgZWrZ2/Gwmm/gYuP/np6lBHfcVJIOpRoiU6DELXY7Zrn
	8FSrEovlQ3GxdHmXFowCAcF4e52TtUI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-sHnoj5iOPSSzAuoUGKheXw-1; Mon, 14 Jul 2025 16:39:43 -0400
X-MC-Unique: sHnoj5iOPSSzAuoUGKheXw-1
X-Mimecast-MFC-AGG-ID: sHnoj5iOPSSzAuoUGKheXw_1752525583
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae6c9aa2c93so409114266b.1
        for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 13:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752525582; x=1753130382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
        b=jdYxN/AgP5yjFlqzVjdVtHPVtBk5g93ZdDVAH0Ko1CVA1McQbVzYbqilONZgihpQSq
         AFfAXWlnIyRm7dhaUQXapTdcu7adyYuxroTtVBB0dQnLBAL4LkD70Bzzuit1r4nrnFwV
         G+l6tdZp1T0IbX4fZIyCG/93I78CwY1lPYH4njr0i9kP1TTBAHOug5bLehyp2fiBWSBH
         ZXIML2wLHd5su4aColR7u9klmh9/UbgG/d3YTkjgY/EAof86BEcbQA2I+EVFIAeEDBkL
         hMMS6wTc5/MKsflxXEnuyTEH1U+sp8zmAVNy2gb2VGXRPJhvABkTmXGhH0DBIV8gwjDK
         VmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+eeydfWryeyF2ixtvi1zctF1+Y4joZxzMrhrR01I6vkmSehHmk4XAEunvx3vkx5wqSjFOb+XsipjSXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtnBW7WqE3ZMJqCILOva1MQ4FYVs88ybhgj+XdNxe07kl0wuy
	GjSGQQIa00hIlTqeedJLxv0Q8n89q6nKm82IK1wweXCEJibHlzjCjvTCG4Z/uEF35pkIXC3lZOz
	+Sz75O3ovjVupBmF2NpZdqT3RvJVcMxOQYNumQqsGUxFkIKhRUVh8hCPPDarBNMWt4px09DNJAO
	JKa/S/okw2W79vES0pmSvJ1n/Wy+m/9rA3cMwjV4Y=
X-Gm-Gg: ASbGncuQt1eGf0fOxGolO2Vt02L6S1DpsoiYfQuQu36KbOvZblpVZqtnyEZZ1fae1NB
	uh8crtkMztDeG0oBuVO5Bp2xsTzfeLtOmal7qnI6JDTT0tpqpJfDSmQvIWpgo2PkCNbsa3n3h8W
	DU35zldqzIJ155Q7AZDKAB
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id a640c23a62f3a-ae6fc6aa6dcmr1561812466b.2.1752525582629;
        Mon, 14 Jul 2025 13:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtOtCIDm5iIRXUzH93pKL+mJg2YxukWxSYyuAjAlCNSpCWGK9PKhS/khXgGAJEgay188lilBak/nz6CZiqGvQ=
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id
 a640c23a62f3a-ae6fc6aa6dcmr1561809066b.2.1752525582243; Mon, 14 Jul 2025
 13:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com> <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
In-Reply-To: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 14 Jul 2025 16:39:31 -0400
X-Gm-Features: Ac12FXxNfqVieUoHNPgnW-EodFqKMjypw83pf906bEoCpdOuQyrxKsmWcymmig0
Message-ID: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zqzdgz9uv-NIooVjTmI3LuF12XwnTAiNPQXUbi3KZGs_1752525583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Thu, Jul 10, 2025 at 12:09=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 7/10/25 5:51 PM, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> come to think of it, there are a lot of drivers that can not
> do any rate rounding - perhaps we could introduce a NOP implementation
> in the clk core that we could reference, instead of copypasting
> int foo(...) { "return 0" }?

I'll look at that for a second round of cleanup once all of the
round_rates have been removed from the tree. From what I recall about
the ~200 or so round_rate implementations in the kernel tree, there
were maybe only 5 or so that cover this noop case. QC seemed to have
the most from what I recall.

It wouldn't be hard to make a Coccinelle script to look for the noop
determine_rate() implementations.

Brian

