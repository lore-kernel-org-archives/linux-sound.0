From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Nov 2020 08:41:46 +0000
Subject: Re: [PATCH v2] drivers: most: add ALSA sound driver
Message-Id: <20201117084145.GB29398@kadam>
List-Id: <linux-sound.vger.kernel.org>
References: <1604680254-17185-1-git-send-email-christian.gromm@microchip.com>
 <20201110084826.GE29398@kadam>
 <564d35a4fc32866f91f5bf3fb1bb16a5c67b3d9e.camel@microchip.com>
In-Reply-To: <564d35a4fc32866f91f5bf3fb1bb16a5c67b3d9e.camel@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian.Gromm@microchip.com
Cc: gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, linux-sound@vger.kernel.org

On Tue, Nov 17, 2020 at 08:08:50AM +0000, Christian.Gromm@microchip.com wrote:
> On Tue, 2020-11-10 at 11:48 +0300, Dan Carpenter wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Fri, Nov 06, 2020 at 05:30:54PM +0100, Christian Gromm wrote:
> > > +static struct list_head adpt_list;
> > > +
> > > +#define MOST_PCM_INFO (SNDRV_PCM_INFO_MMAP | \
> > > +                    SNDRV_PCM_INFO_MMAP_VALID | \
> > > +                    SNDRV_PCM_INFO_BATCH | \
> > > +                    SNDRV_PCM_INFO_INTERLEAVED | \
> > > +                    SNDRV_PCM_INFO_BLOCK_TRANSFER)
> > > +
> > > +static void swap_copy16(u16 *dest, const u16 *source, unsigned int bytes)
> > > +{
> > > +     unsigned int i = 0;
> > > +
> > > +     while (i < (bytes / 2)) {
> > > +             dest[i] = swab16(source[i]);
> > > +             i++;
> > > +     }
> > > +}
> > > +
> > > +static void swap_copy24(u8 *dest, const u8 *source, unsigned int bytes)
> > > +{
> > > +     unsigned int i = 0;
> > > +
> > > +     while (i < bytes - 2) {
> > 
> > Can bytes ever be zero?  If so then this will corrupt memory and crash.
> > 
> > Generally "int i;" is less risky than "unsigned int i;".  Of course, I
> > recently almost introduced a situation where we were copying up to
> > ULONG_MAX bytes so there are times when iterators should be size_t so
> > that does happen.  It could be buggy either way is what I'm saying but
> > generally "unsigned int i;" is more often buggy.
> > 
> > > +             dest[i] = source[i + 2];
> > > +             dest[i + 1] = source[i + 1];
> > > +             dest[i + 2] = source[i];
> > > +             i += 3;
> > > +     }
> > > +}
> > > +
> > > +static void swap_copy32(u32 *dest, const u32 *source, unsigned int bytes)
> > > +{
> > > +     unsigned int i = 0;
> > > +
> > > +     while (i < bytes / 4) {
> > > +             dest[i] = swab32(source[i]);
> > > +             i++;
> > > +     }
> > > +}
> > > +
> > > +static void alsa_to_most_memcpy(void *alsa, void *most, unsigned int bytes)
> > > +{
> > > +     memcpy(most, alsa, bytes);
> > > +}
> > > +
> > > +static void alsa_to_most_copy16(void *alsa, void *most, unsigned int bytes)
> > > +{
> > > +     swap_copy16(most, alsa, bytes);
> > > +}
> > > +
> > > +static void alsa_to_most_copy24(void *alsa, void *most, unsigned int bytes)
> > > +{
> > > +     swap_copy24(most, alsa, bytes);
> > > +}
> > > +
> > > +static void alsa_to_most_copy32(void *alsa, void *most, unsigned int bytes)
> > > +{
> > > +     swap_copy32(most, alsa, bytes);
> > > +}
> > > +
> > > +static void most_to_alsa_memcpy(void *alsa, void *most, unsigned int bytes)
> > > +{
> > > +     memcpy(alsa, most, bytes);
> > > +}
> > > +
> > > +static void most_to_alsa_copy16(void *alsa, void *most, unsigned int bytes)
> > > +{
> > > +     swap_copy16(alsa, most, bytes);
> > > +}
> > > +
> > > +static void most_to_alsa_copy24(void *alsa, void *most, unsigned int bytes)
> > > +{
> > > +     swap_copy24(alsa, most, bytes);
> > > +}
> > > +
> > > +static void most_to_alsa_copy32(void *alsa, void *most, unsigned int bytes)
> > > +{
> > > +     swap_copy32(alsa, most, bytes);
> > > +}
> > > +
> > > +/**
> > > + * get_channel - get pointer to channel
> > > + * @iface: interface structure
> > > + * @channel_id: channel ID
> > > + *
> > > + * This traverses the channel list and returns the channel matching the
> > > + * ID and interface.
> > > + *
> > > + * Returns pointer to channel on success or NULL otherwise.
> > > + */
> > > +static struct channel *get_channel(struct most_interface *iface,
> > > +                                int channel_id)
> > > +{
> > > +     struct sound_adapter *adpt = iface->priv;
> > > +     struct channel *channel, *tmp;
> > > +
> > > +     list_for_each_entry_safe(channel, tmp, &adpt->dev_list, list) {
> > > +             if ((channel->iface = iface) && (channel->id = channel_id))
> > > +                     return channel;
> > 
> > No need to use the _safe() version of this loop macro.  You're not
> > freeing anything.  My concern is that sometimes people think the _safe()
> > has something to do with locking and it does not.
> > 
> > > +     }
> > > +     return NULL;
> > > +}
> > > +
> > 
> > [ Snip ]
> > 
> > > +/**
> > > + * audio_probe_channel - probe function of the driver module
> > > + * @iface: pointer to interface instance
> > > + * @channel_id: channel index/ID
> > > + * @cfg: pointer to actual channel configuration
> > > + * @arg_list: string that provides the name of the device to be created in /dev
> > > + *         plus the desired audio resolution
> > > + *
> > > + * Creates sound card, pcm device, sets pcm ops and registers sound card.
> > > + *
> > > + * Returns 0 on success or error code otherwise.
> > > + */
> > > +static int audio_probe_channel(struct most_interface *iface, int channel_id,
> > > +                            struct most_channel_config *cfg,
> > > +                            char *device_name, char *arg_list)
> > > +{
> > > +     struct channel *channel;
> > > +     struct sound_adapter *adpt;
> > > +     struct snd_pcm *pcm;
> > > +     int playback_count = 0;
> > > +     int capture_count = 0;
> > > +     int ret;
> > > +     int direction;
> > > +     u16 ch_num;
> > > +     char *sample_res;
> > > +     char arg_list_cpy[STRING_SIZE];
> > > +
> > > +     if (cfg->data_type != MOST_CH_SYNC) {
> > > +             pr_err("Incompatible channel type\n");
> > > +             return -EINVAL;
> > > +     }
> > > +     strlcpy(arg_list_cpy, arg_list, STRING_SIZE);
> > > +     ret = split_arg_list(arg_list_cpy, &ch_num, &sample_res);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     list_for_each_entry(adpt, &adpt_list, list) {
> > > +             if (adpt->iface != iface)
> > > +                     continue;
> > > +             if (adpt->registered)
> > > +                     return -ENOSPC;
> > > +             adpt->pcm_dev_idx++;
> > > +             goto skip_adpt_alloc;
> > 
> > It's weird how if the "channel = " allocation fails, then we free this
> > "adpt" which we didn't allocate.
> 
> We actually did allocate it in a previous call to this function.
> Otherwise we would not jump to the skip_adpt_alloc label. And if
> we don't jump there, we are allocating it right away.
> 

I mean obviously everyone can see that it was allocated by an earlier
call to the function.  What I mean is that it's a layering violation.
The unwind would normally be done in the caller.

Is it okay to delete the adapter without emptying the mdev_link_list
as well?

regards,
dan carpenter
