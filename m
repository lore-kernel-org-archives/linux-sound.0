Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA9199E8D
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211580; cv=none; b=A/87G1XDWJxY+90drNKNPZ0yvk4cITswgw81GRRfeXLInKD104y+aaU7EfNX/Bjihc/+lZ8j11kcImKN3x8VGbs1wB4zm+4iLh2jte78BJz5ggFAK22Rp6aS/grTwd/90ESi0TYG4CTT/K0Ug7cY+6E0xQXHkfxhfFT8hBVg3mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211580; c=relaxed/simple;
	bh=YtyX5+qRGf3h+1QGw2ZkpBZLtiW6f53RHY2ZQEyYvnQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ZbLibF9ibMpNrp/V64fkaur/jkp8SJBIWNwGU9K8Ja/oYbqFEKexIAkhVEKULMeI4cT6AfNzOJFNtnbBbab0CNOT2jsll1Gc74mdDQPblMT3rKZmYof3jHQUzG8BqSj7XJMdP+dbfGePSgMBax2q6dt1ZRn92U1UN+LGuGEy4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rVhKb6YU; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rVhKb6YU"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250317113935euoutp02714126a1ab3c4917e3903874032f3539~tlDKOnmWQ0093100931euoutp02y
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 11:39:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250317113935euoutp02714126a1ab3c4917e3903874032f3539~tlDKOnmWQ0093100931euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742211575;
	bh=YtyX5+qRGf3h+1QGw2ZkpBZLtiW6f53RHY2ZQEyYvnQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=rVhKb6YUO1grA4Mj7B6J0xBm5tyifWO/2gUwwB7TlR/dmD8LJsOnNHSdd/vpcjldq
	 3SSmz7ZRzktO5cUnWX8xX56ZhuWePRhjSuZmMhT5efYENlRjZ3WSfIzSIi0zlDFxR5
	 wMgadIKeU84bTVntQf++bMqnxvqLI6v8JtzDml3k=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250317113935eucas1p261bf967997b16319ba363dbdbd67aaf8~tlDJmo6Pk0547605476eucas1p2V;
	Mon, 17 Mar 2025 11:39:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 86.C3.20821.6F908D76; Mon, 17
	Mar 2025 11:39:34 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250317113934eucas1p13ea947bd63179d1fa19fccb84bf84cce~tlDJTfPqY2006120061eucas1p1O;
	Mon, 17 Mar 2025 11:39:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250317113934eusmtrp271e539180c03f7ef2b0c7d39951452d6~tlDJS9KES0706407064eusmtrp2a;
	Mon, 17 Mar 2025 11:39:34 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-cb-67d809f6b29b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id B7.99.19920.6F908D76; Mon, 17
	Mar 2025 11:39:34 +0000 (GMT)
Received: from AMDN5751 (unknown [106.210.134.141]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250317113934eusmtip2375168f114805c2df1d616b37d5debbe~tlDI_1MIE2333723337eusmtip2x;
	Mon, 17 Mar 2025 11:39:34 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>, "'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>
In-Reply-To: <20250317095603.20073-77-tiwai@suse.de>
Subject: RE: [PATCH v2 76/88] ASoC: samsung: Convert to RUNTIME_PM_OPS() &
 co
Date: Mon, 17 Mar 2025 12:39:34 +0100
Message-ID: <000101db9731$41783430$c4689c90$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIqwrc/eYLAHwCagbNNEilNOeRj4gLTxbVrAx7iLDqyqUdY8A==
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsWy7djP87rfOG+kG8xosrWY+vAJm8XcZ1OY
	LV5ufsPkwOyxaVUnm8fm09UenzfJBTBHcdmkpOZklqUW6dslcGVMf3KdtaCLpeLTMqMGxv3M
	XYwcHBICJhLPlpt2MXJxCAmsYJS4tOU9UJwTyPnCKHFkvzpE4jOjxOofC1hBEiANC5pmsEIk
	ljNKzLncywzhvGCUaHvyig2kik3AWKJ/wVpGEFtEwFPiVOs5JhCbWUBR4v/aA2BxTqBJncse
	soDYwgL+EsdvTgRbzSKgKrHow3+w83gFLCV2rRMGCfMKCEqcnPmEBWKMvMT2t3OYIQ5SkPj5
	dBkrxConiU+zulghakQkbjxqYQS5TUJgD4fE1UVfGCEaXCS2fJkC9Y2wxKvjW9ghbBmJ/zvn
	M0HY9RLfnx+Bau5glLj/YCYLRMJa4tzNiewgxzELaEqs36UPEXaU+P2ulxUSpHwSN94KQtzA
	JzFp23RoSPNKdLQJQVSrSPxeNZ1pAqPyLCSfzULy2SwkH8xC2LWAkWUVo3hqaXFuemqxYV5q
	uV5xYm5xaV66XnJ+7iZGYPo4/e/4px2Mc1991DvEyMTBeIhRgoNZSYTX/cn1dCHelMTKqtSi
	/Pii0pzU4kOM0hwsSuK8i/a3pgsJpCeWpGanphakFsFkmTg4pRqYxNamL/wRunZaY8jGacXL
	NJc9vJC755THxB38crf4Yma8ObXpV9athKLwwPmlR1IkWyYs5Iuaa2ix7GPVSo+N3TdrFnHu
	jjexl3vzOjov+6Hy9mWpx374ms6fyLvxRX1saKV9Hf/9io+84ULsWon7jx3wYnOteLxHM+Dd
	AkVVYblTnRliRjv3TZh++bTLHkZOk0SRpxZefwTkskRcJQyPTg/NPZZ612Tp47Vm11WOdmw5
	H2K+NKjG4WCPxE6LtqlfvD6nn0h4ptTQutjB7H5ce1+G6Un20EOXcr6wtdrP5onqWpXhEtR/
	atacg2m7W/M4GlP439WKLpIx8j37d++BQvvq3hOXhF8ffuXvM6FKiaU4I9FQi7moOBEAz0gs
	+I4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xe7rfOG+kGyzeo2kx9eETNou5z6Yw
	W7zc/IbJgdlj06pONo/Np6s9Pm+SC2CO0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2
	j7UyMlXSt7NJSc3JLEst0rdL0MuY/uQ6a0EXS8WnZUYNjPuZuxg5OSQETCQWNM1g7WLk4hAS
	WMoosez2Z6AEB1BCSmJ+ixJEjbDEn2tdbBA1zxglfs74zw6SYBMwluhfsJYRxBYR8Ja4OKOB
	BcRmFlCU+L/2ACNEwxpGiTOvv7OCJDiBtnUuewhWJCzgK7Fj8W82EJtFQFVi0Yf/YIt5BSwl
	dq0TBgnzCghKnJz5hAUkzCygJ9G2kRFivLzE9rdzoO5XkPj5dBkrxAlOEp9mdbFC1IhI3HjU
	wjiBUXgWkkmzECbNQjJpFpKOBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjaNuxn5t3
	MM579VHvECMTB+MhRgkOZiURXvcn19OFeFMSK6tSi/Lji0pzUosPMZoCPTaRWUo0OR8YyXkl
	8YZmBqaGJmaWBqaWZsZK4rxul8+nCQmkJ5akZqemFqQWwfQxcXBKNTAtbDFd9UTx2tdCttWH
	FmoXJb7ct2P2pPt3+JkeBMXJbTtdsHxH9KXqywcPK6ftKNrseihykf+RzTym27suxc9cmtGi
	YCC4eSPDFo66A7Kl+a9kN33zff1dvuP7Ks/3FUlTsmvrc7NmijUm9Jz9tXLNh9u/rFxeBEzS
	TZ65nIHLf2/IXOcf9/wPBi2I/B1V3tW6dtnGi1adrqmmn2KfL18p9XevvIFooOa1i2r/W46E
	8/hq3ZFde0+6oqvYJi8wL8AuV+9byP25uq9k5hV4fMlsOtesE7eY6UOf7YSvxyYEbfX/4L1J
	2VHff2eM7jvukJ2fjvx90mpZpxa2YNHhbbH33Of8nHn3voZtsfWRtUtUlViKMxINtZiLihMB
	IyzItiwDAAA=
X-CMS-MailID: 20250317113934eucas1p13ea947bd63179d1fa19fccb84bf84cce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250317095632eucas1p19d266b2633a63d2ed73c13423c57fe06
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250317095632eucas1p19d266b2633a63d2ed73c13423c57fe06
References: <20250317095603.20073-1-tiwai@suse.de>
	<CGME20250317095632eucas1p19d266b2633a63d2ed73c13423c57fe06@eucas1p1.samsung.com>
	<20250317095603.20073-77-tiwai@suse.de>


Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/samsung/i2s.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

