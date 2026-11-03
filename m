Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726633;
	b=2DYRrkSMXsHg+zFNJSUUSS9LyXMP8bcbyW9NwVizN63E/qtX63t0JXeCZLTN00sbPmdy
	 6YCcsKxMhtWV2sYN7Cc3VPLkQhxUelZ1kiTBOO60KyXHdgMNkXlRAgB2OAW/7hM/Jjf9i
	 89ItTvuaSMM1QOZCsp21BiY1wFwX6P6R5cB/ExRDTsc7Hn2Mh9pp7lWWuAyaQ+XsXlc/s
	 p1xGrlj+vXVTSuejHT9NIl/3VSsskLKAdF922X6aBMouMQYhWD3Gda3lJnxsPnIWIHGj+
	 fxZeLH8otxYl8EiIpAHxQGlrv1K78rvzh6kT4gjnl38Ef5lz5VrZngELP9KciBB81/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726633;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gRn8vis5DOULWk1zfuTEJH9AWsXL8eGHin+pgixM6g4=;
	b=pb2eUDirHSMQiYrAVzO+3TrMRkfKxb7o3PU6nUQqK0Gyh+d0mnf28STf6PPo3C9SIhh4
	 nEYAbx1/L9qhidyWCM07yB8j1C0qCpNTwcgOamn+oXTyAswbIcIlAX/Je4zQu+1vEmJkB
	 qXoIOLXZKf8pczVWU4mcUBnM5Ms5W7+QGWT6NYZtiB2saWlDsUKDXWJSzIufxnckaEJjP
	 OpEUViKyAFwLpuaymeQGnDCIa2eY4JvPa2YP+bEWvglYHKrfJ8PC5KMseYAH1KBWxrAWZ
	 ulUBzh9Utc7NNLgOj37/dJJSRPzqKTXi67WWoK/5Og4vVhlm+2GpPh65adWW5Td1J8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KKnzxBgY;
	arc=none smtp.remote-ip=91.218.175.185
Received: from mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF9606A33D
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 17:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AF9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KKnzxBgY
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y10FOlAcC/oG9QAZv0id6dgMDiBvnnmya5qRSsRSBZA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793726627; v=1; x=1794331427;
 b=KKnzxBgYuHumL68QcHkG3lOc+Av8ygNAMH580Dyhu2mt8+OL2fGHgoLuiczXr6uREFJA4rtw
 q66pW3JVYpx89obOtQwS8wBnc52/JHzRhGEjMCYvtM+1suDYYq3lZ3P70hApyceRWfdwtLeAvja
 cwl7m8AcfnvDVpzo7sOJFBVY=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6669ce5724e75a4e;
	Tue, 03 Nov 2026 17:23:47 +0000
X-Mizu-Trace-ID: 6669ce5724e75a4e
X-Migadu-Flow: FLOW_OUT
Message-ID: <bf8b2bd0-2f6c-4c1c-9b14-adef63695ed5@linux.dev>
Date: Tue, 3 Nov 2026 18:07:14 +0100
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
Subject: Re: [PATCH v1] ASoC: tas2783-sdw: Add basic BPT support
To: Baojun Xu <baojun.xu@ti.com>, broonie@kernel.org
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com,
 henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com, pin-hao.huang@hp.com,
 Syed.SabaKareem@amd.com, Matthew Schwartz <matthew.schwartz@linux.dev>
References: <20261103133853.1612-1-baojun.xu@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261103133853.1612-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +static int tas2783_fw_download_bpt(struct tas2783_prv *tas_dev,
> +				   const struct firmware *fmw)
> +{
> +	struct sdw_slave *slave = tas_dev->sdw_peripheral;
> +	struct sdw_bpt_section *sections = NULL;
> +	struct sdw_bus *bus = slave->bus;
> +	struct sdw_bpt_msg msg = {0};
> +	struct tas_fw_file file;
> +	struct tas_fw_hdr hdr;
> +	size_t offset = FW_DL_OFFSET;
> +	size_t img_sz = fmw->size;
> +	const u8 *buf = fmw->data;
> +	int num_sections = 0;
> +	int i, ret;
> +
> +	if (img_sz < FW_DL_OFFSET)
> +		return -EINVAL;
> +
> +	tas_fw_read_hdr(buf, &hdr);
> +	if (hdr.size != img_sz)
> +		return -EINVAL;
> +
> +	while (offset < (img_sz - FW_FL_HDR)) {
> +		size_t adv = (size_t)tas_fw_get_next_file(&buf[offset], &file);
> +
> +		/*
> +		 * Reject a section whose payload runs past the image. Compare
> +		 * file.length (not adv) against the space left after this
> +		 * section's header, so the check is immune to the size_t wrap
> +		 * in tas_fw_get_next_file() on 32-bit kernels.
> +		 */
> +		if (file.length > img_sz - offset - FW_FL_HDR) {
> +			dev_err(tas_dev->dev,
> +				"Firmware section at offset %zu exceeded.\n",
> +				offset);
> +			return -EINVAL;
> +		}
> +		if (num_sections >= TAS2783_MAX_FW_SECTIONS) {
> +			dev_err(tas_dev->dev,
> +				"BPT fw has too many sections (max %d)\n",
> +				TAS2783_MAX_FW_SECTIONS);
> +			return -EINVAL;
> +		}
> +		offset += adv;
> +		num_sections++;
> +	}
> +
> +	if (num_sections == 0)
> +		return -EINVAL;
> +
> +	sections = kcalloc(num_sections, sizeof(*sections), GFP_KERNEL);
> +	if (!sections)
> +		return -ENOMEM;
> +
> +	offset = FW_DL_OFFSET;
> +	for (i = 0; i < num_sections && offset < (img_sz - FW_FL_HDR); i++) {
> +		size_t adv = (size_t)tas_fw_get_next_file(&buf[offset], &file);
> +
> +		sections[i].addr = file.dest_addr;
> +		sections[i].len = file.length;
> +		sections[i].buf = file.fw_data;
> +		offset += adv;
> +
> +		dev_dbg(tas_dev->dev, "BPT section %d: addr=0x%x len=%d",
> +			i, file.dest_addr, file.length);
> +	}
> +
> +	msg.sec = sections;
> +	msg.sections = num_sections;
> +	msg.dev_num = slave->dev_num;
> +	msg.flags = SDW_MSG_FLAG_WRITE;
> +
> +	dev_dbg(tas_dev->dev, "BPT starting: %d sections, dev_num=%d",
> +		num_sections, slave->dev_num);
> +
> +	ret = sdw_bpt_send_sync(bus, slave, &msg);
> +
> +	if (ret < 0)
> +		dev_err(tas_dev->dev, "BPT firmware download failed: %d", ret);
> +	else
> +		dev_dbg(tas_dev->dev,
> +			 "BPT firmware download complete: %d sections",
> +			 num_sections);
> +
> +	kfree(sections);
> +	return ret;
> +}
Before adding BPT-based optimizations to speed-up firmware download,
it'd be good to address existing problems with firmware download, e.g.
when a firmware contains volume configuration information that bypasses
regmap, see the thread in "ASoC: tas2783-sdw: keep the volume settings
across resets". Using BPT will only make things worse I am afraid,
unless there's a check that this is only used for resources not managed
by regmap?
