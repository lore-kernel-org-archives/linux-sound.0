Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763863;
	b=kauF8oO1BlFRvinS9rKxGYzIIUgFi3+u2GnsB0qmfsiFegJTrcihsku5jZi09wTb/pEZ
	 UCI92ZMJOGnnUSdIWpCJXU1/RRNae/nHJ4BPe4jgvN++1JtxEwn1w4CcQDvkp31lPGfi9
	 ybsG8wiEjAOfBckKlVW2Ii3runX9Kcc+LE21SqZm2ABVr45H3tPgM5/sMVZFNu15OOrJD
	 TV4gM2sX4qs7GRYQoY4EOugwAUQ4QTtfYqvxZ1Y90ke0uKQ0G9UPSJSNVL6hEi+hxUkuW
	 J7s4IcjrkJ2a/6IZOo4B1kwuXXWdUTQPnG0i0JPtufTohJdgtaxeLD/tfe7GB4Yg/TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763863;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ZDxWq3H+nQgSm2N5ZS0dn18NbG9MPkdtWJ8/RojaxCM=;
	b=aRVGlnR206YQ9fYj06xoZZvADUki51cyyNjCqlD6fuCjGvj/AMuczJ90cw7N00IACP2f
	 eMxt4KrbnhRA3lpTUkVKrwqqIdJGq0XSKJMlvlid1uQBPnvFAJj2SIxWijvwyx7+GL5vt
	 lMqUlaxRjEUe4YbZC/0E8rvJeSRGKee3Rsl+yaDsQzQ8mxyCL9BHNeq1ZYrjoEkWrqCPg
	 gSbEhbKMplGVsUtnvsyfcIZNFSW3Jt0GYVXyhZl9hIRxcURW2T1WMi0NFFUXbnXGTKdeX
	 lq/xDPI5jqfz2BKGw3W4FwlDd5IiI5Pe9+H0m5Vaq1vTl/ms7uynZfAC8ghDtSEryoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DC8606A31C;
	Fri, 27 Nov 2026 07:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36DC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=ZDxWq3H+nQgSm2N5ZS0dn18NbG9MPkdtWJ
	8/RojaxCM=; b=ZUygs/Xl33DYSeoJRJON5ZzAyhOfmRBwV7niP8Ydvb/rxM7CCi
	Is/SOvIt/J/G41J6PVOSti31am0Y78Onh0hahp77u3AfMzxZOFv+Jl9aHZ06u/f1
	ChKf+MzQeCdpZzbeJPzHhGYlVszdSEOMhnEZcHFf4PO8Mk0oidMHCxOok=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.43])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkDW2fx+LglrOi1RAg--.138S2;
	Fri, 27 Nov 2026 15:17:20 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot ci <syzbot+ci4a0a685a2ad8288a@syzkaller.appspotmail.com>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Subject: Re: [syzbot ci] Re: ALSA: line6: Stop URBs synchronously via sync_stop callback
Date: Fri, 27 Nov 2026 15:17:18 +0800
Message-Id: <20261127071718.3004-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6b0921f3.1492ceaa.187240.0078.GAE@google.com>
References: <6b0921f3.1492ceaa.187240.0078.GAE@google.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkDW2fx+LglrOi1RAg--.138S2
X-Coremail-Antispam: 1UD129KBjvdXoWrAw13tw1DJFyfJF48Cw4kWFg_yoWxXFb_ua
	4DXF93Ww4UXrn2ga1UKF17tr9xGr48Wr17XrykKrZrAr9ayF9rWFZ8KFyrCryI9ws2vrW5
	JwnIv34xZw12yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
	evJa73UjIFyTuYvjfUY3kuUUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUJD2sIS1kirAAEs5

Hi,

Thanks for the report.  This crash is from v4 of the series, which lacked
the guard for the URB array in the probe failure path: line6_init_pcm()
publishes line6->line6pcm before creating the URBs, so a failing probe
reaches line6_pcm_disconnect() with pcms->urbs == NULL.

v5 and v6 already contain the fix:

	/* May be called when the URB creation failed during the probe */
	if (!pcms->urbs)
		return;

	v6: https://lore.kernel.org/all/20261122104039.7160-1-25031212351@stu.xidian.edu.cn

v6 applies to the reported base (9437ee8b6cf6) and passes the compile
check, so no separate fix is needed.

Thanks,
YuanZhe Liu

